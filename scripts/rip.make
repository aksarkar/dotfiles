all: cdda.flac install clean

install: replaygain
	rsync -q -f '+ */' -f '+ *.ogg' -f '- *' -au . ~/music/$(notdir $(CURDIR))

replaygain: oggenc
	vorbisgain -q -a *.ogg

oggenc: cdda.toc split
	awk -f ~/.dotfiles/scripts/toc.awk $< | parallel

split: cdda.cue cdda.wav
	cuebreakpoints $< | shntool split $(word 2, $^) || ln cdda.wav split-track01.wav

cdda.flac: cdda.wav
	ffmpeg -v quiet -i $< -acodec flac -compression_level 10 $@

cdda.wav:
	cdparanoia -q 1- $@

cdda.cue: cdda.toc
	toc2cue -v 0 $< $@

cdda.toc:
	cdrdao read-toc -v 0 --with-cddb $@
	emacsclient -c $@

clean:
	rm -f *.wav
	rm -f *.ogg

.PHONY: split oggenc replaygain

TABULA_URL = "https://github.com/tabulapdf/tabula-java/releases/download/v1.0.5/tabula-1.0.5-jar-with-dependencies.jar"


tabula.jar:
	wget -o "$@" $(TABULA_URL)

only-domain-pages.pdf: HE-Frankfurt_am_Main_HRB_83173+Unternehmensvertrag_-_Umwandlungsvertrag_.pdf
	pdftk $< cat 39-end output $@

re-ocr.pdf: only-domain-pages.pdf
	ocrmypdf -l deu --redo-ocr $< $@

extracted.csv: re-ocr.pdf tabula.jar
	java -jar tabula.jar --area "80,30,680,290" --area "80,300,680,550" --pages all --format CSV $< -o $@

domains.csv: extracted.csv
	xsv fixlengths $< | xsv select 2- | sed -E -e 's/,,/,/g' -e 's/,$$//g' -e "s/^[I!|\[\ ']+//g" -e 's/,[I|\[]/,/g' -e 's/Femverkehr/Fernverkehr/g' -e 's/,de,/.de,/g'> $@

clean: 
	rm tabula.jar extracted.csv re-ocr.pdf only-domain-pages.pdf
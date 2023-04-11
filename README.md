Deutsche Bahn (DB) Domains
==========================

In the _Unternehmensvertrag / Umwandlungsvertrag / sonstiger Vertrag vom 21.02.2023_ from _DB Fernverkehr Aktiengesellschaft_ (HRB 83173), where the sales of long distance train tickets moved from DB Vertrieb to DB Fernverkehr a interesting list is attached: lots of domains DB registered for selling tickets, customer information, marketing campaigns and weird other stuff:

![bahn-domains-pdf-preview](https://user-images.githubusercontent.com/172415/231111485-8a60c334-78ff-4f7d-8174-08ecace50803.png)

Because open data in the transport sector is always a good idea, and DB [actually providing some on their Open Data Portal](https://data.deutschebahn.com), lets republish the list of domains in a machine readable format: CSV.

<p align="center">
	→ <a href="domains.csv">to the domains.csv</a> ←
</div>

## Reproducability

To extract the domains.csv yourself, a [Makefile](Makefile) is contained in this repo. For it to work, you need install dependencies and download `HE-Frankfurt_am_Main_HRB_83173+Unternehmensvertrag_-_Umwandlungsvertrag_-20230411101101.pdf` from the Handelsregister first: 
Use the [_normale suche_](https://www.handelsregister.de/rp_web/normalesuche.xhtml) to search for `db fernverkehr ag` and select _alle Schlagwörter enthalten_. From the results, look for _Hessen Amtsgericht Frankfurt am Main HRB 83173_, _DB Fernverkehr Aktiengesellschaft_ and choose _DK_ (document view). Open the tree like this:

```
Dokumente zum Rechtstrager
└─ Dokumente zur Registernummer
	└─ Weitere Urkunden / Unterlagen
		└─ Unternehmensvertrag / Umwandlungsvertrag / sonstiger Vertrag
			├─ Unternehmensvertrag / Umwandlungsvertrag / sonstiger Vertrag vom 23.03.2023
			├─ Unternehmensvertrag / Umwandlungsvertrag / sonstiger Vertrag vom 21.02.2023
			├─ ...
```

Choose _Unternehmensvertrag / Umwandlungsvertrag / sonstiger Vertrag vom **21.02.2023**_, select PDF and download. Remove the `-202...` (timestamp) from the filename.

Needed dependencies:
* pdftk
* https://github.com/ocrmypdf/OCRmyPDF
* http://tabula.technology (will be downloaded by the makefile)
* https://github.com/BurntSushi/xsv

Run `make domains.csv`. The resulting file already got some automatic cleanup steps, but still needs some more manual cleanup.


## Credits

Thanks to 
* [@gglnx](https://github.com/gglnx) for [finding the pdf and tweeting about the `bahn.fail` domain contained therein](https://twitter.com/gglnx/status/1641395659449221121) 
* [ocrmypdf](https://github.com/ocrmypdf/OCRmyPDF) for helping redo the broken ocr in the pdf
* [tabula](http://tabula.technology) for making it easy to extract the data
* [xsv](https://github.com/BurntSushi/xsv) for helping wrangle csv files
* handelsregister.de for providing a public download - even if the interface is literally UX hell and doesn't support permanent document identifiers or direct links.  


## License
Because it is simply a list of factual data, [CC-0](https://creativecommons.org/publicdomain/zero/1.0/deed.de), I guess.

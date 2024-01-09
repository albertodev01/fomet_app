/// The expected Dart object parsed from [categoryTestResponse].
const categoryParsedTestResponse = [
  (code: 'ALB', description: 'Alberi da frutto'),
  (code: 'ARE', description: 'Aree verdi'),
  (code: 'CER', description: 'Cereali'),
];

/// An example of a valid XML response for the categories list.
const categoryTestResponse = '''
<ElencoCategorie xmlns="http://schemas.datacontract.org/2004/07/FometAppService.ccategorie" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Categorie>
        <itemC>
            <Codice>ALB</Codice>
            <Descrizione>Alberi da frutto</Descrizione>
        </itemC>
        <itemC>
            <Codice>ARE</Codice>
            <Descrizione>Aree verdi</Descrizione>
        </itemC>
        <itemC>
            <Codice>CER</Codice>
            <Descrizione>Cereali</Descrizione>
        </itemC>
    </Categorie>
</ElencoCategorie>
''';

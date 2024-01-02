/// The expected Dart object parsed from [varietyTestResponse].
const varietyParsedTestResponse = [
  (code: 'ACT', description: 'Actinidia'),
  (code: 'CAS', description: 'Castagno'),
  (code: 'NOE', description: 'Noce'),
];

/// An example of a valid XML response for the categories list.
const varietyTestResponse = '''
<ElencoVarieta xmlns="http://schemas.datacontract.org/2004/07/FometAppService.CVarieta" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Varieta>
        <itemV>
            <Codice>ACT</Codice>
            <Descrizione>Actinidia</Descrizione>
        </itemV>
        <itemV>
            <Codice>CAS</Codice>
            <Descrizione>Castagno</Descrizione>
        </itemV>
        <itemV>
            <Codice>NOE</Codice>
            <Descrizione>Noce</Descrizione>
        </itemV>
    </Varieta>
</ElencoVarieta>
''';

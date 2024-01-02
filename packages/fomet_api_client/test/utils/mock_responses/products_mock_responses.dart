/// The expected Dart object parsed from [productsTestResponse].
const productsParsedResponse = [
  (
    code: 'AKER/BB',
    description: 'AKER ® PELLET BIG BAG DA 500 KG',
    categoryCode: 'ALB',
    categoryDescription: 'Alberi da frutto',
    varietyCode: 'ACT',
    varietyDescription: 'Actinidia',
  ),
  (
    code: 'AMINCALC012',
    description: 'AMINOSPRINT ® CALCIO DA KG 12',
    categoryCode: 'ALB',
    categoryDescription: 'Alberi da frutto',
    varietyCode: 'ACT',
    varietyDescription: 'Actinidia',
  ),
];

/// An example of a valid XML response for the products list.
const productsTestResponse = r'''
<ElencoArticoli xmlns="http://schemas.datacontract.org/2004/07/FometAppService.CArticoli" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
    <Articoli>
        <itemA>
            <CodCategoria>ALB</CodCategoria>
            <CodVarieta>ACT</CodVarieta>
            <Codice>AKER/BB</Codice>
            <DescCategoria>Alberi da frutto</DescCategoria>
            <DescVarieta>Actinidia</DescVarieta>
            <Descrizione>AKER ® PELLET BIG BAG DA 500 KG</Descrizione>
            <Descrizione2/>
            <immagine>\FOSRV003RobImmaginiAKER.png</immagine>
        </itemA>
        <itemA>
            <CodCategoria>ALB</CodCategoria>
            <CodVarieta>ACT</CodVarieta>
            <Codice>AMINCALC012</Codice>
            <DescCategoria>Alberi da frutto</DescCategoria>
            <DescVarieta>Actinidia</DescVarieta>
            <Descrizione>AMINOSPRINT ® CALCIO DA KG 12</Descrizione>
            <Descrizione2/>
            <immagine>\FOSRV003RobImmaginiAminosprint-calcio.png</immagine>
        </itemA>
    </Articoli>
</ElencoArticoli>
''';

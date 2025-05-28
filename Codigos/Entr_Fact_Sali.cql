// 1 Entrada Detalle
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///EntradaDetalle.csv" AS row RETURN row',
'CREATE (n:EntradaDetalle) SET n = row',
{ batchSize:10000, parallel: true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:EntradaDetalle) RETURN n',
    'SET 
        n.Empresa = row.n.Empresa,
        n.Folio = row.n.Folio,
        n.Partida = toInteger(n.Partida),
        n.Articulo = row.n.Articulo,
        n.Almacen = row.n.Almacen,
        n.Ubicacion = row.n.Ubicacion,
        n.DescripcionArticulo = row.n.DescripcionArticulo,
        n.CodigoAlternoArticulo = row.n.CodigoAlternoArticulo,
        n.Cantidad = toInteger(n.Cantidad),
        n.UMedPartida = toFloat(n.UMedPartida),
        n.CantidadUMedInv = toFloat(n.CantidadUMedInv),
        n.Precio = toFloat(n.Precio),
        n.pctDescuento = toFloat(n.pctDescuento),
        n.pctImpuesto = toFloat(n.pctImpuesto),
        n.TotalImporte = toFloat(n.TotalImporte),
        n.TotalDescuento = toFloat(n.TotalDescuento),
        n.TotalImpuesto = toFloat(n.TotalImpuesto),
        n.Total = toFloat(n.Total)',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_EntradaDetalle FOR (n:EntradaDetalle) ON (n.Folio, n.Partida)

// 2 Entrada Encabezado
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///EntradaEncabezado.csv" AS row RETURN row',
'CREATE (n:Entrada) SET n = row',
{ batchSize:10000, parallel: true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:Entrada) RETURN n',
    'SET 
        n.Empresa = row.n.Empresa,
        n.Folio = row.n.Folio,
        n.Fecha = row.n.Fecha,
        n.Operacion = row.n.Operacion,
        n.Cliente = row.n.Cliente,
        n.Moneda = row.n.Moneda,
        n.Vendedor = row.n.Vendedor,
        n.pctDescuento = toFloat(n.pctDescuento),
        n.TotalImporte = toFloat(n.TotalImporte),
        n.TotalDescuento = toFloat(n.TotalDescuento),
        n.TotalImpuesto = toFloat(n.TotalImpuesto),
        n.Total = toFloat(n.Total),',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_EntradaEncabezado FOR (n:Entrada) ON (n.Folio)

// 3 Salida Detalle
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///SalidaDetalle.csv" AS row RETURN row',
'CREATE (n:SalidaDetalle) SET n = row',
{ batchSize:10000, parallel: true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:SalidaDetalle) RETURN n',
    'SET 
        n.Empresa = row.n.Empresa,
        n.Folio = row.n.Folio,
        n.Partida = toInteger(n.Partida),
        n.Articulo = row.n.Articulo,
        n.Almacen = row.n.Almacen,
        n.Ubicacion = row.n.Ubicacion,
        n.DescripcionArticulo = row.n.DescripcionArticulo,
        n.Cantidad = toInteger(n.Cantidad),
        n.UMedPartida = toFloat(n.UMedPartida),
        n.CantidadUMedInv = toFloat(n.CantidadUMedInv),
        n.Precio = toFloat(n.Precio),
        n.pctDescuento = toFloat(n.pctDescuento),
        n.pctImpuesto = toFloat(n.pctImpuesto),
        n.TotalImporte = toFloat(n.TotalImporte),
        n.TotalDescuento = toFloat(n.TotalDescuento),
        n.TotalImpuesto = toFloat(n.TotalImpuesto),
        n.Total = toFloat(n.Total)',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_SalidaDetalle FOR (n:SalidaDetalle) ON (n.Folio, n.Partida)

// 4 Salida Encabezado
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///SalidaEncabezado.csv" AS row RETURN row',
'CREATE (n:Salida) SET n = row',
{ batchSize:10000, parallel: true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:Salida) RETURN n',
    'SET 
        n.Empresa = row.n.Empresa,
        n.Folio = row.n.Folio,
        n.Fecha = row.n.Fecha,
        n.Cliente = row.n.Cliente,
        n.Moneda = row.n.Moneda,
        n.CondicionPago = row.n.CondicionPago,
        n.MedioEmbarque = row.n.MedioEmbarque,
        n.Vendedor = row.n.Vendedor,
        n.pctDescuento = toFloat(n.pctDescuento),
        n.TotalImporte = toFloat(n.TotalImporte),
        n.TotalDescuento = toFloat(n.TotalDescuento),
        n.TotalImpuesto = toFloat(n.TotalImpuesto),
        n.Total = toFloat(n.Total),',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_SalidaEncabezado FOR (n:Salida) ON (n.Folio)

// 5 Factura Detalle
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///FacturaDetalle.csv" AS row RETURN row',
'CREATE (n:FacturaDetalle) SET n = row',
{ batchSize:10000, parallel: true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:FacturaDetalle) RETURN n',
    'SET 
        n.Empresa = row.n.Empresa,
        n.Folio = row.n.Folio,
        n.Partida = toInteger(n.Partida),
        n.Articulo = row.n.Articulo,
        n.DescripcionArticulo = row.n.DescripcionArticulo,
        n.Cantidad = toInteger(n.Cantidad),
        n.UMedPartida = toFloat(n.UMedPartida),
        n.CantidadUMedInv = toFloat(n.CantidadUMedInv),
        n.Precio = toFloat(n.Precio),
        n.pctDescuento = toFloat(n.pctDescuento),
        n.pctImpuesto = toFloat(n.pctImpuesto),
        n.TotalImporte = toFloat(n.TotalImporte),
        n.TotalDescuento = toFloat(n.TotalDescuento),
        n.TotalImpuesto = toFloat(n.TotalImpuesto),
        n.Total = toFloat(n.Total),
        n.Almacen = row.n.Almacen,
        n.Fecha1 = row.n.Fecha1',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_FacturaDetalle FOR (n:FacturaDetalle) ON (n.Folio, n.Partida)

// 6 Factura
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///FacturaEncabezado.csv" AS row RETURN row',
'CREATE (n:Factura) SET n = row',
{ batchSize:10000, parallel: true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:Factura) RETURN n',
    'SET 
        N.Empresa = row.n.Empresa,
        n.Folio = row.n.Folio,
        n.Fecha = row.n.Fecha,
        n.Cliente = row.n.Cliente,
        n.Moneda = row.n.Moneda,
        n.CondicionPago = row.n.CondicionPago,
        n.MedioEmbarque = row.n.MedioEmbarque,
        n.Vendedor = row.n.Vendedor,
        n.pctDescuentoGlobal = toFloat(n.pctDescuentoGlobal),
        n.RacIVA = toFloat(n.RacIVA),
        n.TotalImporte = toFloat(n.TotalImporte),
        n.TotalDescuento = toFloat(n.TotalDescuento),
        n.TotalRetencion = toFloat(n.TotalRetencion),
        n.Total = toFloat(n.Total)',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_Factura FOR (n:Factura) ON (n.Folio)

// 7 Vendedor
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///Vendedor.csv" AS row RETURN row',
'CREATE (n:Vendedor) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:Vendedor) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Nombre = row.n.Nombre',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_Vendedor FOR (n:Vendedor) ON (n.Clave)

// 8 MedioEmbarque
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///MedioEmbarque.csv" AS row RETURN row',
'CREATE (n:MedioEmbarque) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:MedioEmbarque) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Descripcion = row.n.Descripcion',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_MedioEmbarque FOR (n:MedioEmbarque) ON (n.Clave)

// 9 CondicionPago
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///CondicionPago.csv" AS row RETURN row',
'CREATE (n:CondicionPago) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:CondicionPago) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Descripcion = row.n.Descripcion',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_CondicionPago FOR (n:CondicionPago) ON (n.Clave)

// 10 Moneda
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///Moneda.csv" AS row RETURN row',    
'CREATE (n:Moneda) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:Moneda) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Descripcion = row.n.Descripcion,
        n.Tipo = row.n.Tipo',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_Moneda FOR (n:Moneda) ON (n.Clave)

// 11 Cliente Tipo
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///ClienteTipo.csv" AS row RETURN row',
'CREATE (n:ClienteTipo) SET n = row',
{ batchSize:10000, parallel: true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:ClienteTipo) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Descripcion = row.n.Descripcion,',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_ClienteTipo FOR (n:ClienteTipo) ON (n.Clave)

// 12 Cliente
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///Cliente.csv" AS row RETURN row',
'CREATE (n:Cliente) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:Cliente) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Ciudad = row.n.Ciudad,
        n.Estado = row.n.Estado,
        n.Pais = row.n.Pais
        n.ClienteTipo = row.n.ClienteTipo,
        n.ClienteGrupo = row.n.ClienteGrupo,
        n.Vendedor = row.n.Vendedor,
        n.Moneda = row.n.Moneda,
        n.CondicionPago = row.n.CondicionPago,
        n.ZonaVenta = row.n.ZonaVenta',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_Cliente FOR (n:Cliente) ON (n.Clave)

// 13 ArticuloGrupo
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///ArticuloGrupo.csv" AS row RETURN row',
'CREATE (n:ArticuloGrupo) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:ArticuloGrupo) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Descripcion = row.n.Descripcion',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_ArticuloGrupo FOR (n:ArticuloGrupo) ON (n.Clave)

// 14 ArticuloTipo
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///ArticuloTipo.csv" AS row RETURN row',
'CREATE (n:ArticuloTipo) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:ArticuloTipo) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Descripcion = row.n.Descripcion',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_ArticuloTipo FOR (n:ArticuloTipo) ON (n.Clave)

// 15 ArticuloClase
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///ArticuloClase.csv" AS row RETURN row',
'CREATE (n:ArticuloClase) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:ArticuloClase) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Descripcion = row.n.Descripcion',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_ArticuloClase FOR (n:ArticuloClase) ON (n.Clave)

// 16 Articulo
CALL apoc.periodic.iterate(
'LOAD CSV WITH HEADERS FROM "file:///Articulo.csv" AS row RETURN row',
'CREATE (n:Articulo) SET n = row',
{ batchSize:10000, parallel:true }
)

CALL apoc.periodic.iterate(
    'MATCH (n:Articulo) RETURN n',
    'SET 
        n.Clave = row.n.Clave,
        n.Descripcion = row.n.Descripcion,
        n.ArticuloTipo = row.n.ArticuloTipo,
        n.ArticuloGrupo = row.n.ArticuloGrupo,
        n.ArticuloClase = row.n.ArticuloClase,
        n.Almacenable = row.n.Almacenable,
        n.Identificacion = row.n.Identificacion,
        n.UMedInv = toFloat(n.UMedInv),
        n.UMedVta = toFloat(n.UMedVta),
        n.Moneda = row.n.Moneda,
        n.Precio = toFloat(n.Precio),
        n.pctDescuento = toFloat(n.pctDescuento),
        n.UbicacionAlmacen = row.n.UbicacionAlmacen,
        n.UbicacionClave = row.n.UbicacionClave',
    { batchSize: 10000, parallel: true }
);

CREATE INDEX index_Articulo FOR (n:Articulo) ON (n.Clave)

// Relaciones

// Factura
// 1: FacturaD <-[COMPRADO_EN]- Articulo
CALL apoc.periodic.iterate(
    'MATCH (f:FacturaDetalle), (a:Articulo) WHERE toUpper(trim(f.Articulo)) = toUpper(trim(a.clave)) RETURN f, a',
    'MERGE (f)<-[:COMPRADO_EN]-(a)',
    { batchSize: 10000, parallel: false }
);

// 2: FacturaD <-[DETALLES_DE]- FacturaE
CALL apoc.periodic.iterate(
    'MATCH (fd:FacturaDetalle), (fe:Factura) WHERE toUpper(trim(fd.Folio)) = toUpper(trim(fe.Folio)) RETURN fd, fe',
    'MERGE (fd)<-[:DETALLES_DE]-(fe)',
    { batchSize: 10000, parallel: false }
);

// 3: FacturaE <-[COMPRADOR_DE]- Cliente
CALL apoc.periodic.iterate(
    'MATCH (f:Factura), (c:Cliente) WHERE toUpper(trim(f.Cliente)) = toUpper(trim(c.Clave)) RETURN f, c',
    'MERGE (f)<-[:COMPRADOR_DE]-(c)',
    { batchSize: 10000, parallel: false }
);

// 4: FacturaE <-[TRANSPORTE_DE]- MedioEmbarque
CALL apoc.periodic.iterate(
    'MATCH (f:Factura), (m:MedioEmbarque) WHERE toUpper(trim(f.MedioEmbarque)) = toUpper(trim(m.Clave)) RETURN f, m',
    'MERGE (f)<-[:TRANSPORTE_DE]-(m)',
    { batchSize: 10000, parallel: false }
);

// 5: FacturaE <-[REGISTRADA_EN]- CondicionPago
CALL apoc.periodic.iterate(
    'MATCH (f:Factura), (cp:CondicionPago) WHERE toUpper(trim(f.CondicionPago)) = toUpper(trim(cp.Clave)) RETURN f, cp',
    'MERGE (f)<-[:REGISTRADA_EN]-(cp)',
    { batchSize: 10000, parallel: false }
);

// 6: FacturaE <-[UTILIZADA_EN]- Moneda
CALL apoc.periodic.iterate(
    'MATCH (f:Factura), (m:Moneda) WHERE toUpper(trim(f.Moneda)) = toUpper(trim(m.Clave)) RETURN f, m',
    'MERGE (f)<-[:UTILIZADA_EN]-(m)',
    { batchSize: 10000, parallel: false }
);

// 7: Vendedor -[RESPONSABLE_DE]-> FacturaE
CALL apoc.periodic.iterate(
    'MATCH (v:Vendedor), (f:Factura) WHERE toUpper(trim(f.Vendedor)) = toUpper(trim(v.Clave)) RETURN v, f',
    'MERGE (v)-[:RESPONSABLE_DE]->(f)',
    { batchSize: 10000, parallel: false }
);

// Salida
// 8: SalidaD <-[VENDIDO_EN]- Articulo
CALL apoc.periodic.iterate(
    'MATCH (f:SalidaDetalle), (a:Articulo) WHERE toUpper(trim(f.Articulo)) = toUpper(trim(a.clave)) RETURN f, a',
    'MERGE (f)<-[:VENDIDO_EN]-(a)',
    { batchSize: 10000, parallel: false }
);

// 9: SalidaD <-[ESPECIFICACIONES_DE]- SalidaE
CALL apoc.periodic.iterate(
    'MATCH (fd:SalidaDetalle), (fe:Salida) WHERE toUpper(trim(fd.Folio)) = toUpper(trim(fe.Folio)) RETURN fd, fe',
    'MERGE (fd)<-[:ESPECIFICACIONES_DE]-(fe)',
    { batchSize: 10000, parallel: false }
);

// 10: SalidaE <-[CONSUMIDOR_DE]- Cliente
CALL apoc.periodic.iterate(
    'MATCH (f:Salida), (c:Cliente) WHERE toUpper(trim(f.Cliente)) = toUpper(trim(c.Clave)) RETURN f, c',
    'MERGE (f)<-[:CONSUMIDOR_DE]-(c)',
    { batchSize: 10000, parallel: false }
);

// 11: SalidaE <-[MOVILIZACION_DE]- MedioEmbarque
CALL apoc.periodic.iterate(
    'MATCH (f:Salida), (m:MedioEmbarque) WHERE toUpper(trim(f.MedioEmbarque)) = toUpper(trim(m.Clave)) RETURN f, m',
    'MERGE (f)<-[:MOVILIZACION_DE]-(m)',
    { batchSize: 10000, parallel: false }
);

// 12: SalidaE <-[REPORTADA_EN]- CondicionPago
CALL apoc.periodic.iterate(
    'MATCH (f:Salida), (cp:CondicionPago) WHERE toUpper(trim(f.CondicionPago)) = toUpper(trim(cp.Clave)) RETURN f, cp',
    'MERGE (f)<-[:REPORTADA_EN]-(cp)',
    { batchSize: 10000, parallel: false }
);

// 13: SalidaE <-[DOCUMENTADA_EN]- Moneda
CALL apoc.periodic.iterate(
    'MATCH (f:Salida), (m:Moneda) WHERE toUpper(trim(f.Moneda)) = toUpper(trim(m.Clave)) RETURN f, m',
    'MERGE (f)<-[:DOCUMENTADA_EN]-(m)',
    { batchSize: 10000, parallel: false }
);

// 14: Vendedor -[A_CARGO_DE]-> SalidaE
CALL apoc.periodic.iterate(
    'MATCH (v:Vendedor), (f:Salida) WHERE toUpper(trim(f.Vendedor)) = toUpper(trim(v.Clave)) RETURN v, f',
    'MERGE (v)-[:A_CARGO_DE]->(f)',
    { batchSize: 10000, parallel: false }
);

// Entrada
// 15: EntradaD <-[DISTRIBUIDO_EN]- Articulo
CALL apoc.periodic.iterate(
    'MATCH (f:EntradaDetalle), (a:Articulo) WHERE toUpper(trim(f.Articulo)) = toUpper(trim(a.clave)) RETURN f, a',
    'MERGE (f)<-[:DISTRIBUIDO_EN]-(a)',
    { batchSize: 10000, parallel: false }
);

// 16: EntradaD <-[DATOS_EXTRA_DE]- EntradaE
CALL apoc.periodic.iterate(
    'MATCH (fd:EntradaDetalle), (fe:Entrada) WHERE toUpper(trim(fd.Folio)) = toUpper(trim(fe.Folio)) RETURN fd, fe',
    'MERGE (fd)<-[:DATOS_EXTRA_DE]-(fe)',
    { batchSize: 10000, parallel: false }
);

// 17: EntradaE <-[INTERESADO_EN]- Cliente
CALL apoc.periodic.iterate(
    'MATCH (f:Entrada), (c:Cliente) WHERE toUpper(trim(f.Cliente)) = toUpper(trim(c.Clave)) RETURN f, c',
    'MERGE (f)<-[:INTERESADO_EN]-(c)',
    { batchSize: 10000, parallel: false }
);

// 18: EntradaE <-[LISTADA_EN]- Moneda
CALL apoc.periodic.iterate(
    'MATCH (f:Entrada), (m:Moneda) WHERE toUpper(trim(f.Moneda)) = toUpper(trim(m.Clave)) RETURN f, m',
    'MERGE (f)<-[:LISTADA_EN]-(m)',
    { batchSize: 10000, parallel: false }
);

// 19: Vendedor -[ENCARGADO_DE]-> EntradaE
CALL apoc.periodic.iterate(
    'MATCH (v:Vendedor), (f:Entrada) WHERE toUpper(trim(f.Vendedor)) = toUpper(trim(v.Clave)) RETURN v, f',
    'MERGE (v)-[:ENCARGADO_DE]->(f)',
    { batchSize: 10000, parallel: false }
);

// Articulo
// 20: Articulo <-[TIPO_DE]- ArticuloTipo
CALL apoc.periodic.iterate(
    'MATCH (a:Articulo), (t:ArticuloTipo) WHERE toUpper(trim(a.ArticuloTipo)) = toUpper(trim(t.Clave)) RETURN a, t',
    'MERGE (a)<-[:TIPO_DE]-(t)',
    { batchSize: 10000, parallel: false }
);

// 21: Articulo <-[GRUPO_DE]- ArticuloGrupo
CALL apoc.periodic.iterate(
    'MATCH (a:Articulo), (g:ArticuloGrupo) WHERE toUpper(trim(a.ArticuloGrupo)) = toUpper(trim(g.Clave)) RETURN a, g',
    'MERGE (a)<-[:GRUPO_DE]-(g)',
    { batchSize: 10000, parallel: false }
);

// 22: Articulo <-[CLASE_DE]- ArticuloClase
CALL apoc.periodic.iterate(
    'MATCH (a:Articulo), (c:ArticuloClase) WHERE toUpper(trim(a.ArticuloClase)) = toUpper(trim(c.Clave)) RETURN a, c',
    'MERGE (a)<-[:CLASE_DE]-(c)',
    { batchSize: 10000, parallel: false }
);

// 23: Articulo <-[GASTADA_EN]- Moneda
CALL apoc.periodic.iterate(
    'MATCH (a:Articulo), (m:Moneda) WHERE toUpper(trim(a.Moneda)) = toUpper(trim(m.Clave)) RETURN a, m',
    'MERGE (a)<-[:GASTADA_EN]-(m)',
    { batchSize: 10000, parallel: false }
);

// Cliente
// 24: ClienteTipo -[TIPO_A]-> Cliente
CALL apoc.periodic.iterate(
    'MATCH (ct:ClienteTipo), (c:Cliente) WHERE toUpper(trim(c.ClienteTipo)) = toUpper(trim(ct.Clave)) RETURN ct, c',
    'MERGE (ct)-[:TIPO_A]->(c)',
    { batchSize: 10000, parallel: false }
);

// 25: Cliente <-[PROVEDOR_DE]- Vendedor
CALL apoc.periodic.iterate(
    'MATCH (c:Cliente), (v:Vendedor) WHERE toUpper(trim(c.Vendedor)) = toUpper(trim(v.Clave)) RETURN c, v',
    'MERGE (c)<-[:PROVEDOR_DE]-(v)',
    { batchSize: 10000, parallel: false }
);

// 26: Cliente <-[USADA_DEL]- CondicionPago
CALL apoc.periodic.iterate(
    'MATCH (c:Cliente), (cp:CondicionPago) WHERE toUpper(trim(c.CondicionPago)) = toUpper(trim(cp.Clave)) RETURN c, cp',
    'MERGE (c)<-[:USADA_DEL]-(cp)',
    { batchSize: 10000, parallel: false }
);

// 27: Cliente <-[INVERTIDA_DEL]- Moneda
CALL apoc.periodic.iterate(
    'MATCH (c:Cliente), (m:Moneda) WHERE toUpper(trim(c.Moneda)) = toUpper(trim(m.Clave)) RETURN c, m',
    'MERGE (c)<-[:INVERTIDA_DEL]-(m)',
    { batchSize: 10000, parallel: false }
);

// RecomendacionesSalida
MATCH (a1:Articulo)-[:VENDIDO_EN]->(fd1:SalidaDetalle),
      (a2:Articulo)-[:VENDIDO_EN]->(fd2:SalidaDetalle)
WHERE fd1.Folio = fd2.Folio AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1, a2.Clave AS clave_2, a2.Descripcion AS articulo_2, count(DISTINCT fd1.Folio) AS contador
ORDER BY clave_2

WITH range(0, 10000000, 1000) AS skips
UNWIND skips AS skip
CALL apoc.export.csv.query(
  '
  MATCH (a1:Articulo)-[:VENDIDO_EN]->(fd1:SalidaDetalle),
        (a2:Articulo)-[:VENDIDO_EN]->(fd1:SalidaDetalle)
  WHERE fd1.Folio = fd2.Folio AND id(a1) < id(a2)
  RETURN a1.Clave AS clave_1,
         a1.Descripcion AS articulo_1,
         a2.Clave AS clave_2,
         a2.Descripcion AS articulo_2,
         count(DISTINCT fd1.Folio) AS contador
  ORDER BY clave_2
  SKIP $skipValue
  LIMIT 1000
  ',
  'file:///recomendaciones_salida_' + toString(skip) + '.csv',
  {params: {skipValue: skip}}
)
YIELD file
RETURN file

// RecomendacionesEntrada
MATCH (a1:Articulo)-[:DISTRIBUIDO_EN]->(fd1:EntradaDetalle),
      (a2:Articulo)-[:DISTRIBUIDO_EN]->(fd2:EntradaDetalle)
WHERE fd1.Folio = fd2.Folio AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1, a2.Clave AS clave_2, a2.Descripcion AS articulo_2, count(DISTINCT fd1.Folio) AS contador
ORDER BY clave_2

WITH range(0, 10000000, 1000) AS skips
UNWIND skips AS skip
CALL apoc.export.csv.query(
  '
  MATCH (a1:Articulo)-[:DISTRIBUIDO_EN]->(fd1:EntradaDetalle),
        (a2:Articulo)-[:DISTRIBUIDO_EN]->(fd2:EntradaDetalle)
  WHERE fd1.Folio = fd2.Folio AND id(a1) < id(a2)
  RETURN a1.Clave AS clave_1,
         a1.Descripcion AS articulo_1,
         a2.Clave AS clave_2,
         a2.Descripcion AS articulo_2,
         count(DISTINCT fd1.Folio) AS contador
  ORDER BY clave_2
  SKIP $skipValue
  LIMIT 1000
  ',
  'file:///recomendaciones_entrada_' + toString(skip) + '.csv',
  {params: {skipValue: skip}}
)
YIELD file
RETURN file

// RecomendacionesFactura
MATCH (a1:Articulo)-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1, a2.Clave AS clave_2, a2.Descripcion AS articulo_2, count(DISTINCT fd1.Folio) AS contador
ORDER BY clave_2

WITH range(0, 10000000, 1000) AS skips
UNWIND skips AS skip
CALL apoc.export.csv.query(
  '
  MATCH (a1:Articulo)-[:COMPRADO_EN]->(fd1:FacturaDetalle),
        (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
  WHERE fd1.Folio = fd2.Folio AND id(a1) < id(a2)
  RETURN a1.Clave AS clave_1,
         a1.Descripcion AS articulo_1,
         a2.Clave AS clave_2,
         a2.Descripcion AS articulo_2,
         count(DISTINCT fd1.Folio) AS contador
  ORDER BY clave_2
  SKIP $skipValue
  LIMIT 1000
  ',
  'file:///recomendaciones_factura_' + toString(skip) + '.csv',
  {params: {skipValue: skip}}
)
YIELD file
RETURN file

// Comprobacion de recomendaciones Factura
MATCH (a1:Articulo {Clave: "ELCS1095EL          "})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY clave_2

MATCH (a1:Articulo {Clave: "FNFEX95R            "})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY clave_2

MATCH (a1:Articulo {Clave: "HDDCPU99            "})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "MECNT288            "})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "80101F4231          "})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Descripcion: "DEFENSA DEL NEON 02                               "})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Descripcion: "PUERTA TSURU 92-04 DEL IZQ"})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Descripcion: "CUBIERTA MERCEDES A 160"})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Descripcion: "*COFRE DERBY 97-03"})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Descripcion: "ALERON DEL KA 2001 NEGRO IZQ"})-[:COMPRADO_EN]->(fd1:FacturaDetalle),
      (a2:Articulo)-[:COMPRADO_EN]->(fd2:FacturaDetalle)
WHERE fd1.Folio = fd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT fd1.Folio) AS contador
ORDER BY contador DESC

// Comprobacion de recomendaciones Entrada
MATCH (a1:Articulo {Clave: "CNPU94              "})-[:DISTRIBUIDO_EN]->(ed1:EntradaDetalle),
      (a2:Articulo {Clave: "SPCPU99L            "})-[:DISTRIBUIDO_EN]->(ed2:EntradaDetalle)
WHERE ed1.Folio = ed2.Folio
  AND id(a1) < id(a2)
RETURN collect(ed1. Folio), count(DISTINCT ed1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "PVJE93              "})-[:DISTRIBUIDO_EN]->(ed1:EntradaDetalle),
      (a2:Articulo {Clave: "A004177             "})-[:DISTRIBUIDO_EN]->(ed2:EntradaDetalle)
WHERE ed1.Folio = ed2.Folio
  AND id(a1) < id(a2)
RETURN collect(ed1. Folio), count(DISTINCT ed1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "CNPU94              "})-[:DISTRIBUIDO_EN]->(ed1:EntradaDetalle),
      (a2:Articulo {Clave: "PDSP90              "})-[:DISTRIBUIDO_EN]->(ed2:EntradaDetalle)
WHERE ed1.Folio = ed2.Folio
  AND id(a1) < id(a2)
RETURN collect(ed1. Folio), count(DISTINCT ed1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "DTFES96             "})-[:DISTRIBUIDO_EN]->(ed1:EntradaDetalle),
      (a2:Articulo)-[:DISTRIBUIDO_EN]->(ed2:EntradaDetalle)
WHERE ed1.Folio = ed2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT ed1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "442-1123R           "})-[:DISTRIBUIDO_EN]->(ed1:EntradaDetalle),
      (a2:Articulo)-[:DISTRIBUIDO_EN]->(ed2:EntradaDetalle)
WHERE ed1.Folio = ed2.Folio AND a1.ArticuloClase = a2.ArticuloClase
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.ArticuloClase, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.ArticuloClase, a2.Descripcion AS articulo_2,
       count(DISTINCT ed1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "DDVGO93             "})-[:DISTRIBUIDO_EN]->(ed1:EntradaDetalle),
      (a2:Articulo)-[:DISTRIBUIDO_EN]->(ed2:EntradaDetalle)
WHERE ed1.Folio = ed2.Folio AND a1.ArticuloTipo = a2.ArticuloTipo
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.ArticuloTipo, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.ArticuloTipo, a2.Descripcion AS articulo_2,
       count(DISTINCT ed1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "SFCO90L             "})-[:DISTRIBUIDO_EN]->(ed1:EntradaDetalle),
      (a2:Articulo)-[:DISTRIBUIDO_EN]->(ed2:EntradaDetalle)
WHERE ed1.Folio = ed2.Folio AND a1.ArticuloGrupo = a2.ArticuloGrupo
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.ArticuloGrupo, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.ArticuloGrupo, a2.Descripcion AS articulo_2,
       count(DISTINCT ed1.Folio) AS contador
ORDER BY contador DESC

// Comprobacion de recomendaciones Salida
MATCH (a1:Articulo {Clave: "DTNA1081            "})-[:VENDIDO_EN]->(sd1:SalidaDetalle),
      (a2:Articulo {Clave: "BFNT185R            "})-[:VENDIDO_EN]->(sd2:SalidaDetalle)
WHERE sd1.Folio = sd2.Folio
  AND id(a1) < id(a2)
RETURN collect(sd1. Folio), count(DISTINCT sd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "331-1922R           "})-[:VENDIDO_EN]->(sd1:SalidaDetalle),
      (a2:Articulo {Clave: "BTDGC93P            "})-[:VENDIDO_EN]->(sd2:SalidaDetalle)
WHERE sd1.Folio = sd2.Folio
  AND id(a1) < id(a2)
RETURN collect(sd1. Folio), count(DISTINCT sd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "CHCNPU94            "})-[:VENDIDO_EN]->(sd1:SalidaDetalle),
      (a2:Articulo {Clave: "333-1105R           "})-[:VENDIDO_EN]->(sd2:SalidaDetalle)
WHERE sd1.Folio = sd2.Folio
  AND id(a1) < id(a2)
RETURN collect(sd1. Folio), count(DISTINCT sd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "DDFTO92             "})-[:VENDIDO_EN]->(sd1:SalidaDetalle),
      (a2:Articulo)-[:DISTRIBUIDO_EN]->(sd2:EntradaDetalle)
WHERE sd1.Folio = sd2.Folio
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.Descripcion AS articulo_2,
       count(DISTINCT sd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "ELDNE00R            "})-[:VENDIDO_EN]->(sd1:SalidaDetalle),
      (a2:Articulo)-[:VENDIDO_EN]->(sd2:SalidaDetalle)
WHERE sd1.Folio = sd2.Folio AND a1.ArticuloClase = a2.ArticuloClase
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.ArticuloClase, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.ArticuloClase, a2.Descripcion AS articulo_2,
       count(DISTINCT sd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "TIDTPU84D           "})-[:VENDIDO_EN]->(sd1:SalidaDetalle),
      (a2:Articulo)-[:VENDIDO_EN]->(sd2:SalidaDetalle)
WHERE sd1.Folio = sd2.Folio AND a1.ArticuloTipo = a2.ArticuloTipo
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.ArticuloTipo, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.ArticuloTipo, a2.Descripcion AS articulo_2,
       count(DISTINCT sd1.Folio) AS contador
ORDER BY contador DESC

MATCH (a1:Articulo {Clave: "62215F4030          "})-[:VENDIDO_EN]->(sd1:SalidaDetalle),
      (a2:Articulo)-[:VENDIDO_EN]->(sd2:SalidaDetalle)
WHERE sd1.Folio = sd2.Folio AND a1.ArticuloGrupo = a2.ArticuloGrupo
  AND id(a1) < id(a2)
RETURN a1.Clave AS clave_1, a1.ArticuloGrupo, a1.Descripcion AS articulo_1,
       a2.Clave AS clave_2, a2.ArticuloGrupo, a2.Descripcion AS articulo_2,
       count(DISTINCT sd1.Folio) AS contador
ORDER BY contador DESC

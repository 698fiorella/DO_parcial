use kaggle
go
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE Object_id=OBJECT_ID(N'dbo.starbucks') AND type='U')
-- Crear la tabla
create table dbo.starbucks (
				baverage_category VARCHAR(50),
				baverage VARCHAR(100),
				baverage_pre VARCHAR(50),
				calories DECIMAL (6,3),
				total_fag_g VARCHAR(10),
				trans_fag_g VARCHAR(10),
				saturated_fag_g DECIMAL(6,3),
				sodium_mg DECIMAL(6,3),
				total_carbohydrates_g DECIMAL(6,3),
				cholesterol_mg DECIMAL(6,3),
				dietary_fibre_g DECIMAL(6,3),
				sugars_g DECIMAL(6,3),
				protein_g DECIMAL(6,3),
				vitamin_a_pct VARCHAR(10),
				vitamin_c_pct VARCHAR(10),
				calcium_pct VARCHAR(10),
			    iron_pct VARCHAR(10),
				caffeine_mg VARCHAR(10),
)
Go
-- si ya existe la tabla dbo.starbucks LA LIMPIA
TRUNCATE TABLE dbo.starbucks;
GO

-- importar data desde archivo
BULK INSERT dbo.starbucks
FROM 'C:\Users\fiore\OneDrive\Escritorio\Proyecto_parcial\dataset\starbucks.csv'
WITH
(
	FIRSTROW = 2, --empieza en la 2da fila, ya que la letra es la cabecera
	FIELDTERMINATOR = ',', --indicando separador de columnas
	ROWTERMINATOR = '0x0a' --hace referencia a un salto de linea
)
Go
select *from starbucks


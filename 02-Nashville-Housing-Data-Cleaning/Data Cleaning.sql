SELECT TOP (1000) [UniqueID]
      ,[ParcelID]
      ,[LandUse]
      ,[PropertyAddress]
      ,[SaleDate]
      ,[SalePrice]
      ,[LegalReference]
      ,[SoldAsVacant]
      ,[OwnerName]
      ,[OwnerAddress]
      ,[Acreage]
      ,[TaxDistrict]
      ,[LandValue]
      ,[BuildingValue]
      ,[TotalValue]
      ,[YearBuilt]
      ,[Bedrooms]
      ,[FullBath]
      ,[HalfBath]
  FROM [PortfolioProject].[dbo].[Nashville Housing Data for Data Cleaning ]


  select * from PortfolioProject..[Nashville Housing Data for Data Cleaning ]

  --standardised date format converting
  select SaleDate, CONVERT(date,SaleDate) as date_without_time
  from PortfolioProject..[Nashville Housing Data for Data Cleaning ] 

  --adding new col by converting existing (using alter_+update) (can only be done by alter too but safer eith alter plus update)

  alter table PortfolioProject..[Nashville Housing Data for Data Cleaning ] add ConvertedSales DATE; 

  update PortfolioProject..[Nashville Housing Data for Data Cleaning ] set ConvertedSales = CONVERT(date, SaleDate);

    select ConvertedSales-- CONVERT(date,SaleDate) as date_without_time
  from PortfolioProject..[Nashville Housing Data for Data Cleaning ]; 






  --all same parcel ids have to have same address(populate same address for same ids having diff unique id)(SELF JOIN)

  --FIND ALL NULL ADDRESSES(THEY ARE THE SAME FOR SAME PARCEL ID)
  select original.ParcelID, original.PropertyAddress, dup.ParcelID, DUP.PropertyAddress 
  from PortfolioProject..[Nashville Housing Data for Data Cleaning ] as original
  join PortfolioProject..[Nashville Housing Data for Data Cleaning ] as dup
  on original.ParcelID=dup.ParcelID and original.UniqueID<>dup.UniqueID
  where original.PropertyAddress is null

  --REPLACE ALL NULL ADDRESSES (AND THEN DISPLAY TABLE-NOT DONE HERE-can use upper query)
  update original
  set PropertyAddress = ISNULL(original.PropertyAddress,dup.PropertyAddress) --replaces all is null values from specific col in table a to specific value 
  from PortfolioProject..[Nashville Housing Data for Data Cleaning ] as original
  join PortfolioProject..[Nashville Housing Data for Data Cleaning ] as dup
  on original.ParcelID=dup.ParcelID and original.UniqueID<>dup.UniqueID


  --split first comma in address into parts using substring and charindex and alter,update,display (CAN ONLY BE USED FOR ONE COMMA)
  select SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as address_before_comma,
  SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) as address_after_comma
  from PortfolioProject..[Nashville Housing Data for Data Cleaning ]

  ALTER TABLE PortfolioProject..[Nashville Housing Data for Data Cleaning ] 
ADD address_before_comma NVARCHAR(255),
    address_after_comma NVARCHAR(255);

UPDATE PortfolioProject..[Nashville Housing Data for Data Cleaning ] 
SET address_before_comma = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1),
    address_after_comma  = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))


SELECT address_before_comma, address_after_comma 
FROM PortfolioProject..[Nashville Housing Data for Data Cleaning ];



  --split multiple commas using replace and parsename functions, alter,update,display
  select PARSENAME(Replace(OwnerAddress,',','.'),1) as last_address_before_comma,
  PARSENAME(Replace(OwnerAddress,',','.'),2) as middle_address_after_comma,
  PARSENAME(Replace(OwnerAddress,',','.'),3) as first_address_before_comma
  from PortfolioProject..[Nashville Housing Data for Data Cleaning ]


    ALTER TABLE PortfolioProject..[Nashville Housing Data for Data Cleaning ] 
ADD first_address_before_comma NVARCHAR(255),
    middle_address_after_comma NVARCHAR(255),
    last_address_before_comma NVARCHAR(255);

UPDATE PortfolioProject..[Nashville Housing Data for Data Cleaning ] 
SET first_address_before_comma = PARSENAME(Replace(OwnerAddress,',','.'),3),
    middle_address_after_comma  = PARSENAME(Replace(OwnerAddress,',','.'),2),
    last_address_before_comma = PARSENAME(Replace(OwnerAddress,',','.'),1)


SELECT first_address_before_comma, middle_address_after_comma,last_address_before_comma
FROM PortfolioProject..[Nashville Housing Data for Data Cleaning ];



--make y or n yes or no (strings are case-insensitive)
SELECT SoldAsVacant,
    CASE 
        WHEN UPPER(SoldAsVacant) = 'Y' THEN 'Yes'
        WHEN UPPER(SoldAsVacant) = 'N' THEN 'No'
        ELSE SoldAsVacant
    END AS SoldAsVacantCleaned
FROM PortfolioProject..[Nashville Housing Data for Data Cleaning ];



--find and delete dups --only ctes allow row num()
with cte_table as(
select *, ROW_NUMBER() OVER(
PARTITION BY ParcelID,PropertyAddress,SaleDate,SalePrice,LegalReference ORDER BY UniqueID) as row_num
FROM PortfolioProject..[Nashville Housing Data for Data Cleaning ])
select * from cte_table where row_num>1 --use delete from for all these dups




--(DO THE FOLLOWING ONLY AFTER DELETING DUPS FROM EARLIER STEP)


--drop ununsed cols like ones you split using replace or substring or parsenames or charindex 
alter table PortfolioProject..[Nashville Housing Data for Data Cleaning ]
drop column OwnerAddr4ess, TaxDistrict, PropertyAddress

--display table now 
  select * from PortfolioProject..[Nashville Housing Data for Data Cleaning ]

/*EJERCICIO 1: Nombre de los productos y unidades en Stock de los productos que se 
encuentran descontinuados, muestre los primeros 5 registros ordenados de mayor a 
menor por Stock.*/
SELECT ProductName, UnitsInStock FROM Product WHERE Discontinued=1 ORDER By UnitsInStock desc LIMIT 5;

/*EJERCICIO 2: Calcule el total de ventas donde la venta es igual a: (Precio Unitario-Descuento)*Cantidad*/
SELECT sum ((UnitPrice - Discount) * Quantity) as Ventas FROM OrderDetail;


/*EJERCICIO 3: Muestre el total de ventas por país de origen del cliente.*/
SELECT sum(( a.UnitPrice - a.Discount) * a.Quantity) as Ventas, c.Country as País FROM OrderDetail as a
inner JOIN  'Order' as b on a.OrderId = b.Id inner JOIN Customer as c on b.CustomerId = c.Id Group by País;

/*EJERCICIO 4: Calcule el total de descuento por categoría de producto y ordénelo de manera 
descendente. */
SELECT sum(a.Discount * a.Quantity) as Descuento, c.CategoryName as Categoría FROM OrderDetail as a 
INNER JOIN Product as b on a.ProductId=b.Id INNER JOIN Category as c on 
b.CategoryId= c.Id GROUP BY Categoría ORDER BY Descuento; 

/*EJERCICIO 5: Los proveedores de España solicitan conocer la demanda de sus productos a través de los 
meses. La información que se compartirá corresponde a la cantidad de producto vendido 
de acuerdo a su fecha de pedido. Muestre la información de manera gráfica*/

SELECT strftime('%Y-%m',OrderDate) As Fecha_de_pedido, ProductName, sum(Quantity) As Cantidad_de_producto_vendido
FROM Supplier
INNER JOIN Product
ON Product.SupplierId = Supplier.Id
INNER JOIN OrderDetail
ON OrderDetail.ProductId = Product.Id
INNER JOIN 'Order'
ON 'Order'.Id = OrderDetail.OrderId
Where Supplier.Country = "Spain"
GROUP BY Fecha_de_pedido, ProductName



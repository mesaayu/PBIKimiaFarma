#Berikut adalah query datamart berdasarkan hasil aggregasi dari ke-empat tabel yang sudah diimport sebelumnya
  
create table kimia_farma.datamart_kimiafarma as
SELECT 
  ft.transaction_id, 
  ft.date, 
  inv.branch_id, 
  kc.branch_name, 
  kc.kota, 
  kc.provinsi, 
  kc.rating as rating_cabang,
  ft.customer_name, 
  prd.product_id, 
  prd.product_name, 
  prd.price as actual_price, 
  ft.discount_percentage,
  CASE
      WHEN prd.price <= 50000 THEN 0.1
      WHEN prd.price > 50000 AND prd.price <= 100000 THEN 0.15
      WHEN prd.price > 100000 AND prd.price <= 300000 THEN 0.2
      WHEN prd.price > 300000 AND prd.price <= 500000 THEN 0.25
    ELSE 0.3
  END AS persentase_gross_laba,
  prd.price * (1 - ft.discount_percentage / 100) AS nett_sales,
  (prd.price * (1 - ft.discount_percentage / 100)) - (prd.price * 
      CASE
        WHEN prd.price <= 50000 THEN 0.1
        WHEN prd.price > 50000 AND prd.price <= 100000 THEN 0.15
        WHEN prd.price > 100000 AND prd.price <= 300000 THEN 0.2
        WHEN prd.price > 300000 AND prd.price <= 500000 THEN 0.25
        ELSE 0.3
      END) AS nett_profit,
  ft.rating as rating_transaksi  
from kimia_farma.kf_final_transaction as ft
left join kimia_farma.kf_inventory as inv ON ft.product_id = inv.product_id and ft.branch_id = inv.branch_id
left join kimia_farma.kf_kantor_cabang as kc ON ft.branch_id = kc.branch_id
left join kimia_farma.kf_product as prd ON ft.product_id = prd.product_id;

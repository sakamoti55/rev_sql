-- Active: 1728409624185@@127.0.0.1@5432@rental
-- 1
SELECT 名前
FROM 生徒データ
JOIN 生徒成績データ ON 生徒データ.生徒番号 = 生徒成績データ.生徒番号
ORDER BY 理科 DESC
LIMIT 1;

-- 2
SELECT DISTINCT(クラブ)
FROM 生徒データ
JOIN クラブデータ ON 生徒データ.生徒番号 = クラブデータ.生徒番号
WHERE 出身中学 = '稲沢第一中学'
;

-- 3
SELECT クラブ,AVG(数学)
FROM 生徒成績データ
JOIN クラブデータ ON 生徒成績データ.生徒番号 = クラブデータ.生徒番号
GROUP BY クラブ
ORDER BY AVG(数学) DESC
LIMIT 5;

-- 4
SELECT クラブデータ.生徒番号
FROM クラブデータ
JOIN 生徒成績データ ON クラブデータ.生徒番号 = 生徒成績データ.生徒番号
WHERE クラブ = 'サッカー部' OR 外国語 < 40
;

-- 5
SELECT クラブデータ.生徒番号
FROM クラブデータ,生徒成績データ
-- ANDが強そう
WHERE 生徒成績データ.生徒番号 = クラブデータ.生徒番号 AND (クラブ = 'サッカー部' OR 外国語 < 40)
;

-- 6
SELECT 貸出月,貸出日,顧客名,タイトル
FROM 貸出データ
JOIN 商品データ ON 貸出データ.商品番号 = 商品データ.商品番号
JOIN 顧客データ ON 貸出データ.顧客番号 = 顧客データ.顧客番号
WHERE 貸出月 = 4 AND 貸出日 BETWEEN 1 AND 7
ORDER BY 貸出日 DESC;

-- 7
SELECT 商品番号
FROM 商品データ
WHERE 商品番号 NOT IN (SELECT DISTINCT(商品番号) FROM 貸出データ)
ORDER BY 商品番号;

-- 8
SELECT DISTINCT(商品データ.商品番号)
FROM 商品データ
LEFT OUTER JOIN 貸出データ ON 商品データ.商品番号 = 貸出データ.商品番号
WHERE 貸出番号 IS NULL
ORDER BY 商品データ.商品番号
;

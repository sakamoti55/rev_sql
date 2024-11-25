-- Active: 1728409624185@@127.0.0.1@5432@students

-- 1
SELECT *
FROM 選択科目データ;

-- 2
SELECT 生徒番号,名前,性別
FROM 生徒データ;

-- 3
SELECT *
FROM 生徒成績データ
WHERE 外国語 >= 70;

-- 4
SELECT *
FROM 生徒成績データ
WHERE 数学 >= 70 AND 国語 >= 70;

-- 5
SELECT *
FROM 生徒成績データ
WHERE 理科 >= 60 AND 理科 < 80;

-- 6
SELECT *
FROM 生徒成績データ
WHERE 理科 >= 90 OR 社会 >= 90;

-- 7
SELECT 名前,性別
FROM 生徒データ
JOIN クラブデータ ON 生徒データ.生徒番号 = クラブデータ.生徒番号
WHERE クラブ = 'サッカー部';

-- 8
SELECT 名前,性別
FROM 生徒データ
JOIN 選択科目データ ON 生徒データ.生徒番号 = 選択科目データ.生徒番号
WHERE 文理選択 = '理系' AND 理科選択 = '物理'

--  9
SELECT 名前,数学
FROM 生徒データ
JOIN 生徒成績データ ON 生徒データ.生徒番号 = 生徒成績データ.生徒番号
JOIN クラブデータ ON 生徒データ.生徒番号 = クラブデータ.生徒番号
WHERE クラブ = '剣道部';

-- 10
SELECT 選択科目データ.生徒番号
FROM 選択科目データ
JOIN 生徒成績データ ON 選択科目データ.生徒番号 = 生徒成績データ.生徒番号
WHERE 数学 < 35 OR 外国語 < 35;

-- 11
SELECT AVG(国語),MAX(国語),MIN(国語)
FROM 生徒成績データ;

-- 12
SELECT *
FROM 生徒成績データ
ORDER BY 国語 DESC
LIMIT 10;

-- 13
SELECT *
FROM 生徒成績データ
WHERE 理科 > 95
ORDER BY 理科 DESC;

-- 14
SELECT DISTINCT(出身中学)
FROM 生徒データ;

-- TEST
SELECT *
FROM 生徒データ
ORDER BY 生徒番号;

-- 15
SELECT COUNT(DISTINCT(クラブ))
FROM クラブデータ;

-- 16
SELECT *
FROM 生徒データ
WHERE 住所 = '伊倉町' OR 住所 = '宇治町';

-- 17
SELECT *
FROM 生徒データ
WHERE 名前 LIKE '%子'
;

-- 18
SELECT 住所
FROM 生徒データ
WHERE 住所 LIKE '__町'
;

-- 19
SELECT クラブ,COUNT(*)
FROM クラブデータ
GROUP BY クラブ
ORDER BY COUNT(*) DESC
;

-- 20
SELECT クラブ,COUNT(*)
FROM クラブデータ
GROUP BY クラブ
HAVING COUNT(*) >= 10
ORDER BY COUNT(*) DESC
;

-- 21
SELECT *
FROM 生徒成績データ
WHERE 数学 >= (SELECT AVG(数学) FROM 生徒成績データ)
;

-- TEST
SELECT AVG(数学)
FROM 生徒成績データ;

-- 22
SELECT 名前,数学
FROM 生徒データ
JOIN 生徒成績データ ON 生徒データ.生徒番号=生徒成績データ.生徒番号
WHERE 数学 >= (SELECT AVG(数学) FROM 生徒成績データ)
;

-- 23
SELECT AVG(外国語)
FROM 生徒成績データ
JOIN 選択科目データ ON 生徒成績データ.生徒番号=選択科目データ.生徒番号
GROUP BY 文理選択
;

-- 23 CASEWHEN
SELECT 
AVG(CASE WHEN 文理選択 = '文系' THEN 外国語 END) AS 文系,
AVG(CASE WHEN 文理選択 = '理系' THEN 外国語 END) AS 理系
FROM 選択科目データ
JOIN 生徒成績データ ON 選択科目データ.生徒番号 = 生徒成績データ.生徒番号
;

-- 24
SELECT 出身中学,AVG(国語) AS T
FROM 生徒データ
JOIN 生徒成績データ ON 生徒データ.生徒番号 = 生徒成績データ.生徒番号
GROUP BY 出身中学
-- AVG(国語)をTで置き換えられない理由は、HAVINGの後にSELECTが行われるため、
-- SELCT文内のエイリアスであるTはまだ使用できないから
-- エイリアス(alias)は、一時的な別名を付与する仕組み
HAVING AVG(国語) >= 90
ORDER BY T DESC
; 

-- TEST
SELECT 出身中学, T
FROM (
  SELECT 出身中学, AVG(国語) AS T
  FROM 生徒データ
  JOIN 生徒成績データ ON 生徒データ.生徒番号 = 生徒成績データ.生徒番号
  GROUP BY 出身中学
) AS 中間テーブル
WHERE T >= 90
ORDER BY T DESC;

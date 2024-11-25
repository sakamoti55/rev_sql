-- Active: 1728631457135@@127.0.0.1@5432@students

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

DELETE 
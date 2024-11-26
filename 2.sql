-- Active: 1728409624185@@127.0.0.1@5432@students

--1 
SELECT DISTINCT(住所)
FROM 生徒データ;

-- 2
SELECT 生徒データ.生徒番号,数学,
    CASE 
        WHEN 数学 >= 90 THEN 'S'
        WHEN 数学 >  80 THEN 'A'
        WHEN 数学 >  70 THEN 'B'
        WHEN 数学 >  60 THEN 'C'
        ELSE 'D'
    END AS 評価
FROM 生徒データ
JOIN 生徒成績データ ON 生徒データ.生徒番号 = 生徒成績データ.生徒番号
;

-- 2
SELECT 生徒データ.生徒番号,数学,
    CASE 
        WHEN 数学 >= 90 THEN 'S'
        WHEN 数学 >  80 THEN 'A'
        WHEN 数学 >  70 THEN 'B'
        WHEN 数学 >  60 THEN 'D'
        ELSE 'D'
    END AS 評価
FROM 生徒データ
JOIN 生徒成績データ ON 生徒データ.生徒番号 = 生徒成績データ.生徒番号
;

-- 3
SELECT 生徒データ.生徒番号,数学,国語
FROM 生徒データ
JOIN 生徒成績データ ON 生徒データ.生徒番号 = 生徒成績データ.生徒番号
WHERE 数学 < 60 AND 国語 >= 60
;

-- 4
SELECT AVG(外国語+数学+国語+理科+社会)
FROM 生徒成績データ;

-- TEST
SELECT *
FROM 生徒成績データ;

-- 5
SELECT 理科選択,COUNT(*)
FROM 選択科目データ
WHERE 文理選択 = '理系'
GROUP BY 理科選択
ORDER BY COUNT(*) DESC
;

-- TEST
SELECT *
FROM 選択科目データ;

-- 6
SELECT クラス,
    COUNT(CASE WHEN 性別 = '男' THEN 1 END),
    COUNT(CASE WHEN 性別 = '女' THEN 1 END)
FROM 生徒データ
GROUP BY クラス
ORDER BY クラス;

-- TEST
SELECT *
FROM 生徒データ;

-- 7
SELECT クラブ,COUNT(*)
FROM クラブデータ
GROUP BY クラブ
HAVING COUNT(*) < 5
;



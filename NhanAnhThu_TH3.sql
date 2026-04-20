
-- BẢNG MONHOC
CREATE TABLE MONHOC (
    MAMH NUMBER(8) PRIMARY KEY,
    TENMH VARCHAR2(50),
    HOCPHI NUMBER(9,2),
    MON_TRUOC NUMBER(8),
    NGUOITAO VARCHAR2(30),
    NGAYTAO DATE,
    NGUOISUA VARCHAR2(30),
    NGAYSUA DATE
);

-- BẢNG LOPHOC

CREATE TABLE LOPHOC (
    MALOP NUMBER(8) PRIMARY KEY,
    MAMH NUMBER(8),
    SOLOP NUMBER(3),
    NGAYBATDAU DATE,
    PHONG VARCHAR2(50),
    MAGV NUMBER(8),
    SISO NUMBER(3),
    NGUOITAO VARCHAR2(30),
    NGAYTAO DATE,
    NGUOISUA VARCHAR2(30),
    NGAYSUA DATE,
    CONSTRAINT FK_LOP_MON FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
);

-- BẢNG SINHVIEN 
CREATE TABLE SINHVIEN (
    MASV NUMBER(8) PRIMARY KEY,
    TEN VARCHAR2(25),
    HO VARCHAR2(25),
    DIACHI VARCHAR2(50),
    NGAYDK DATE,
    NGUOITAO VARCHAR2(30),
    NGAYTAO DATE,
    NGUOISUA VARCHAR2(30),
    NGAYSUA DATE
);

-- BẢNG GIANGVIEN 
CREATE TABLE GIANGVIEN (
    MAGV NUMBER(8) PRIMARY KEY,
    TEN VARCHAR2(25),
    HO VARCHAR2(25),
    DIACHI VARCHAR2(50),
    NGUOITAO VARCHAR2(30),
    NGAYTAO DATE,
    NGUOISUA VARCHAR2(30),
    NGAYSUA DATE
);

-- BẢNG DANGKY
CREATE TABLE DANGKY (
    MASV NUMBER(8),
    MALOP NUMBER(8),
    NGAYDK DATE,
    DIEM NUMBER(3),
    NGUOITAO VARCHAR2(30),
    NGAYTAO DATE,
    NGUOISUA VARCHAR2(30),
    NGAYSUA DATE,
    CONSTRAINT PK_DANGKY PRIMARY KEY (MASV, MALOP),
    CONSTRAINT FK_DK_SV FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),
    CONSTRAINT FK_DK_LOP FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP)
);

-- BẢNG DIEM 
CREATE TABLE DIEM (
    MASV NUMBER(8),
    MALOP NUMBER(8),
    DIEMSO NUMBER(3),
    GHICHU VARCHAR2(200),
    NGUOITAO VARCHAR2(30),
    NGAYTAO DATE,
    NGUOISUA VARCHAR2(30),
    NGAYSUA DATE,
    
    CONSTRAINT PK_DIEM PRIMARY KEY (MASV, MALOP),
    CONSTRAINT FK_DIEM_SV FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),
    CONSTRAINT FK_DIEM_LOP FOREIGN KEY (MALOP) REFERENCES LOPHOC(MALOP)
);
-- ================= MONHOC =================
INSERT INTO MONHOC VALUES (101, 'Lap trinh Java', 3000000, NULL, USER, SYSDATE, USER, SYSDATE);
INSERT INTO MONHOC VALUES (102, 'Co so du lieu', 2500000, NULL, USER, SYSDATE, USER, SYSDATE);
INSERT INTO MONHOC VALUES (103, 'Tri tue nhan tao', 4000000, 101, USER, SYSDATE, USER, SYSDATE);
INSERT INTO MONHOC VALUES (104, 'Mang may tinh', 2800000, NULL, USER, SYSDATE, USER, SYSDATE);
INSERT INTO MONHOC VALUES (105, 'He dieu hanh', 2700000, NULL, USER, SYSDATE, USER, SYSDATE);

-- ================= GIANGVIEN =================
INSERT INTO GIANGVIEN VALUES (1, 'An', 'Nguyen Van', 'TP Ho Chi Minh', USER, SYSDATE, USER, SYSDATE);
INSERT INTO GIANGVIEN VALUES (2, 'Binh', 'Tran Thi', 'Ha Noi', USER, SYSDATE, USER, SYSDATE);
INSERT INTO GIANGVIEN VALUES (3, 'Cuong', 'Le Van', 'Da Nang', USER, SYSDATE, USER, SYSDATE);
INSERT INTO GIANGVIEN VALUES (4, 'Dung', 'Pham Thi', 'Can Tho', USER, SYSDATE, USER, SYSDATE);
INSERT INTO GIANGVIEN VALUES (5, 'Huy', 'Hoang Van', 'Hai Phong', USER, SYSDATE, USER, SYSDATE);
-- ================= SINHVIEN =================
INSERT INTO SINHVIEN VALUES (201, 'Nam', 'Le Van', 'TP Ho Chi Minh', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (202, 'Hoa', 'Pham Thi', 'Ha Noi', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (203, 'Minh', 'Vo Van', 'Da Nang', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (204, 'Lan', 'Nguyen Thi', 'Can Tho', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (205, 'Tuan', 'Tran Van', 'Binh Duong', SYSDATE, USER, SYSDATE, USER, SYSDATE);

-- ================= LOPHOC =================
INSERT INTO LOPHOC VALUES (301, 101, 1, SYSDATE, 'Phong A1', 1, 30, USER, SYSDATE, USER, SYSDATE);
INSERT INTO LOPHOC VALUES (302, 102, 1, SYSDATE, 'Phong B1', 2, 25, USER, SYSDATE, USER, SYSDATE);
INSERT INTO LOPHOC VALUES (303, 103, 1, SYSDATE, 'Phong C1', 3, 20, USER, SYSDATE, USER, SYSDATE);
INSERT INTO LOPHOC VALUES (304, 104, 1, SYSDATE, 'Phong D1', 4, 35, USER, SYSDATE, USER, SYSDATE);
INSERT INTO LOPHOC VALUES (305, 105, 1, SYSDATE, 'Phong E1', 5, 40, USER, SYSDATE, USER, SYSDATE);
INSERT INTO LOPHOC VALUES (306, 101, 2, SYSDATE, 'Phong A2', 1, 30, USER, SYSDATE, USER, SYSDATE);
INSERT INTO LOPHOC VALUES (307, 102, 2, SYSDATE, 'Phong B2', 1, 25, USER, SYSDATE, USER, SYSDATE);
INSERT INTO LOPHOC VALUES (308, 103, 2, SYSDATE, 'Phong C2', 1, 20, USER, SYSDATE, USER, SYSDATE);
INSERT INTO LOPHOC VALUES (309, 104, 2, SYSDATE, 'Phong D2', 1, 35, USER, SYSDATE, USER, SYSDATE);

COMMIT;

-- ================= DANGKY =================
INSERT INTO DANGKY VALUES (201, 301, SYSDATE, 85, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (201, 302, SYSDATE, 78, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (202, 301, SYSDATE, 90, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (202, 303, SYSDATE, 88, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (203, 302, SYSDATE, 70, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (204, 304, SYSDATE, 65, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (205, 305, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);

-- ================= DIEM =================
INSERT INTO DIEM VALUES (201, 301, 85, 'Hoc tot', USER, SYSDATE, USER, SYSDATE);
INSERT INTO DIEM VALUES (202, 301, 90, 'Xuat sac', USER, SYSDATE, USER, SYSDATE);
INSERT INTO DIEM VALUES (203, 302, 70, 'Trung binh', USER, SYSDATE, USER, SYSDATE);
INSERT INTO DIEM VALUES (204, 304, 65, 'Can co gang', USER, SYSDATE, USER, SYSDATE);
INSERT INTO DIEM VALUES (205, 305, 80, 'Kha', USER, SYSDATE, USER, SYSDATE);

COMMIT;
SET SERVEROUTPUT ON;

-- Thêm sinh viên mới
INSERT INTO SINHVIEN VALUES (206, 'A', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (207, 'B', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (208, 'C', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (209, 'D', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (210, 'E', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (211, 'F', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (212, 'G', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (213, 'H', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (214, 'I', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (215, 'K', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (216, 'L', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (217, 'M', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (218, 'N', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (219, 'O', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SINHVIEN VALUES (220, 'P', 'Test', 'HCM', SYSDATE, USER, SYSDATE, USER, SYSDATE);

-- Đăng ký vào lớp 301 (môn 101)
INSERT INTO DANGKY VALUES (206, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (207, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (208, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (209, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (210, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (211, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (212, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (213, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (214, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (215, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (216, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (217, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (218, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (219, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);
INSERT INTO DANGKY VALUES (220, 301, SYSDATE, 80, USER, SYSDATE, USER, SYSDATE);

COMMIT;
--------------------------------BAITAP---------------------------

-- Câu 1a
CREATE TABLE Cau1 (
    ID NUMBER,
    NAME VARCHAR2(50)
);

-- Câu 1b
CREATE SEQUENCE Cau1Seq
START WITH 5
INCREMENT BY 5;

SET SERVEROUTPUT ON;

-- Câu 1c → 1j
DECLARE
    v_name VARCHAR2(50);
    v_id NUMBER;
BEGIN
    -- [d] Sinh viên đăng ký NHIỀU lớp nhất
    SELECT HO || ' ' || TEN
    INTO v_name
    FROM (
        SELECT sv.HO, sv.TEN
        FROM SINHVIEN sv
        JOIN DANGKY dk ON sv.MASV = dk.MASV
        GROUP BY sv.MASV, sv.HO, sv.TEN
        ORDER BY COUNT(*) DESC
    )
WHERE ROWNUM = 1;

    INSERT INTO Cau1 VALUES (Cau1Seq.NEXTVAL, v_name);
    SAVEPOINT sp_a;

    -- [e] Sinh viên đăng ký ÍT lớp nhất
    SELECT HO || ' ' || TEN
    INTO v_name
    FROM (
        SELECT sv.HO, sv.TEN
        FROM SINHVIEN sv
        JOIN DANGKY dk ON sv.MASV = dk.MASV
        GROUP BY sv.MASV, sv.HO, sv.TEN
        ORDER BY COUNT(*) ASC
    )
    WHERE ROWNUM = 1;

    INSERT INTO Cau1 VALUES (Cau1Seq.NEXTVAL, v_name);
    SAVEPOINT sp_b;

    -- [f] Giảng viên dạy NHIỀU lớp nhất
    SELECT HO || ' ' || TEN
    INTO v_name
    FROM (
        SELECT gv.HO, gv.TEN
        FROM GIANGVIEN gv
        JOIN LOPHOC lh ON gv.MAGV = lh.MAGV
        GROUP BY gv.MAGV, gv.HO, gv.TEN
        ORDER BY COUNT(*) DESC
    )
    WHERE ROWNUM = 1;

    INSERT INTO Cau1 VALUES (Cau1Seq.NEXTVAL, v_name);
    SAVEPOINT sp_c;

    -- [g] Lấy ID vừa thêm
    SELECT ID INTO v_id
    FROM Cau1
    WHERE NAME = v_name AND ROWNUM = 1;

    DBMS_OUTPUT.PUT_LINE('ID giang vien nhieu lop: ' || v_id);

    -- [h] Rollback về Savepoint B
    ROLLBACK TO sp_b;

    -- [i] Giảng viên dạy ÍT lớp nhất (dùng lại v_id)
    SELECT HO || ' ' || TEN
    INTO v_name
    FROM (
        SELECT gv.HO, gv.TEN
        FROM GIANGVIEN gv
        JOIN LOPHOC lh ON gv.MAGV = lh.MAGV
        GROUP BY gv.MAGV, gv.HO, gv.TEN
        ORDER BY COUNT(*) ASC
    )
    WHERE ROWNUM = 1;

    INSERT INTO Cau1 VALUES (v_id, v_name);

    -- [j] Thêm lại GV dạy nhiều lớp nhất
    SELECT HO || ' ' || TEN
    INTO v_name
    FROM (
        SELECT gv.HO, gv.TEN
        FROM GIANGVIEN gv
        JOIN LOPHOC lh ON gv.MAGV = lh.MAGV
        GROUP BY gv.MAGV, gv.HO, gv.TEN
        ORDER BY COUNT(*) DESC
    )
    WHERE ROWNUM = 1;

    INSERT INTO Cau1 VALUES (Cau1Seq.NEXTVAL, v_name);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Hoan tat! Chay: SELECT * FROM Cau1;');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Khong tim thay du lieu!');
        ROLLBACK;

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
        ROLLBACK;
END;
/
-----BAI 1 CÂU 2----------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    v_masv NUMBER := &ma_sinh_vien;
    v_ho VARCHAR2(25) := '&ho_sinh_vien';
    v_ten VARCHAR2(25) := '&ten_sinh_vien';
    v_diachi VARCHAR2(50) := '&dia_chi';

    v_hoten VARCHAR2(50);
    v_soluong NUMBER;

BEGIN
    -- Thử tìm sinh viên
    SELECT HO || ' ' || TEN
    INTO v_hoten
    FROM SINHVIEN
    WHERE MASV = v_masv;

    -- Nếu tìm thấy → đếm số lớp đã đăng ký
    SELECT COUNT(*)
    INTO v_soluong
    FROM DANGKY
    WHERE MASV = v_masv;

    DBMS_OUTPUT.PUT_LINE('Họ tên: ' || v_hoten);
    DBMS_OUTPUT.PUT_LINE('Số lớp đã đăng ký: ' || v_soluong);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Nếu không tồn tại → thêm mới
        DBMS_OUTPUT.PUT_LINE('Sinh viên chưa tồn tại. Đang thêm...');

        INSERT INTO SINHVIEN
VALUES (v_masv, v_ten, v_ho, v_diachi, SYSDATE, USER, SYSDATE, USER, SYSDATE);

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Đã thêm sinh viên: ' || v_ho || ' ' || v_ten);

END;
/
--------------------------------BAI 2 CAI 1 -----------------------
SET SERVEROUTPUT ON;

DECLARE
    v_instructor_id NUMBER := &ma_giao_vien;
    v_so_lop NUMBER;
BEGIN
    -- Dem so lop giao vien dang day
    SELECT COUNT(*)
    INTO v_so_lop
    FROM LOPHOC
    WHERE MAGV = v_instructor_id;

    -- Phan nhanh theo ket qua
    IF v_so_lop >= 5 THEN
        DBMS_OUTPUT.PUT_LINE('Giao vien nay nen nghi ngoi!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('So lop giao vien dang day: ' || v_so_lop);
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Khong tim thay giao vien co ma: ' || v_instructor_id);
END;
/
------------------------------CAU 2 BAI 2 ----------------------
SET SERVEROUTPUT ON;

DECLARE
    v_sid NUMBER := &ma_sinh_vien;
    v_cid NUMBER := &ma_lop;
    v_score NUMBER;
    v_grade VARCHAR2(2);
    v_check NUMBER;
BEGIN
    -- Kiem tra sinh vien ton tai
    SELECT COUNT(*) INTO v_check
    FROM SINHVIEN 
    WHERE MASV = v_sid;

    IF v_check = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Loi: Ma sinh vien ' || v_sid || ' khong ton tai!');
        RETURN;
    END IF;

    -- Kiem tra lop ton tai
    SELECT COUNT(*) INTO v_check
    FROM LOPHOC 
    WHERE MALOP = v_cid;

    IF v_check = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Loi: Ma lop ' || v_cid || ' khong ton tai!');
        RETURN;
    END IF;

    -- Lay diem cua sinh vien trong lop
    SELECT DIEMSO
    INTO v_score
    FROM DIEM
    WHERE MASV = v_sid AND MALOP = v_cid;

    -- Quy doi diem so sang diem chu bang CASE
    CASE
        WHEN v_score >= 90 THEN v_grade := 'A';
        WHEN v_score >= 80 THEN v_grade := 'B';
        WHEN v_score >= 70 THEN v_grade := 'C';
        WHEN v_score >= 50 THEN v_grade := 'D';
        ELSE v_grade := 'F';
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Diem so: ' || v_score || ' -> Diem chu: ' || v_grade);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Sinh vien chua dang ky lop nay hoac chua co diem!');
END;
/
---------------------------------BAI 3---------------
SET SERVEROUTPUT ON;

DECLARE
-- Cursor 1: Duyet tung mon hoc
CURSOR cur_course IS
SELECT MAMH, TENMH
FROM MONHOC
ORDER BY MAMH;

-- Cursor 2: Lay lop hoc cua mot mon (co doi so)
CURSOR cur_class (p_mamh NUMBER) IS
SELECT lh.SOLOP,
       COUNT(dk.MASV) AS so_sv
FROM LOPHOC lh
LEFT JOIN DANGKY dk ON lh.MALOP = dk.MALOP
WHERE lh.MAMH = p_mamh
GROUP BY lh.SOLOP
ORDER BY lh.SOLOP;

v_mamh MONHOC.MAMH%TYPE;
v_tenmh MONHOC.TENMH%TYPE;
v_solop LOPHOC.SOLOP%TYPE;
v_count NUMBER;

BEGIN
-- Duyet cursor ngoai: tung mon hoc
OPEN cur_course;
LOOP
    FETCH cur_course INTO v_mamh, v_tenmh;
    EXIT WHEN cur_course%NOTFOUND;

    -- In mon hoc
    DBMS_OUTPUT.PUT_LINE(v_mamh || ' ' || v_tenmh);

    -- Mo cursor trong
    OPEN cur_class(v_mamh);
    LOOP
FETCH cur_class INTO v_solop, v_count;
        EXIT WHEN cur_class%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Lop: ' || v_solop ||
        ' co so luong sinh vien dang ki: ' || v_count);
    END LOOP;

    CLOSE cur_class;
END LOOP;

CLOSE cur_course;

EXCEPTION
    WHEN OTHERS THEN
        IF cur_course%ISOPEN THEN CLOSE cur_course; END IF;
        IF cur_class%ISOPEN THEN CLOSE cur_class; END IF;
        DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
END;
/
------------------------------------CÂU 4---------------------------
--4A
CREATE OR REPLACE PROCEDURE find_sname
(
    i_student_id IN SINHVIEN.MASV%TYPE,
    o_first_name OUT SINHVIEN.TEN%TYPE,
    o_last_name  OUT SINHVIEN.HO%TYPE
)
IS
BEGIN
    SELECT TEN, HO
    INTO o_first_name, o_last_name
    FROM SINHVIEN
    WHERE MASV = i_student_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        o_first_name := NULL;
        o_last_name := NULL;
        DBMS_OUTPUT.PUT_LINE('Khong tim thay sinh vien ID: ' || i_student_id);
END find_sname;
/
---4B
CREATE OR REPLACE PROCEDURE print_student_name
(
    i_student_id IN SINHVIEN.MASV%TYPE
)
IS
    v_first SINHVIEN.TEN%TYPE;
    v_last  SINHVIEN.HO%TYPE;
BEGIN
    -- Goi thu tuc tren
    find_sname(i_student_id, v_first, v_last);

    IF v_first IS NOT NULL OR v_last IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Ho ten sinh vien: ' || v_last || ' ' || v_first);
    END IF;
END print_student_name;
/
BEGIN
    print_student_name(201);
END;
/
--CÂU 2
CREATE OR REPLACE PROCEDURE Discount
IS
BEGIN
    FOR rec IN (
        SELECT mh.MAMH, mh.TENMH, mh.HOCPHI
        FROM MONHOC mh
        WHERE (
            SELECT COUNT(*)
            FROM DANGKY dk
            JOIN LOPHOC lh ON dk.MALOP = lh.MALOP
            WHERE lh.MAMH = mh.MAMH
        ) > 15
    ) LOOP

        -- Giam 5%
        UPDATE MONHOC
        SET HOCPHI = HOCPHI * 0.95
        WHERE MAMH = rec.MAMH;

        DBMS_OUTPUT.PUT_LINE('Da giam gia mon hoc: ' || rec.TENMH
        || ' | Gia cu: ' || rec.HOCPHI
        || ' | Gia moi: ' || ROUND(rec.HOCPHI * 0.95, 2));
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Hoan tat giam gia.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
END Discount;
/
BEGIN
    Discount;
END;
/
--CÂU 4 (3)
------------------------------- CÂU 4 -------------------------------
-- 4a: Function tinh tong hoc phi
CREATE OR REPLACE FUNCTION Total_cost_for_student
(
    p_student_id IN SINHVIEN.MASV%TYPE
)
RETURN NUMBER
IS
    v_total NUMBER;
    v_check NUMBER;
BEGIN
    -- Kiem tra sinh vien ton tai
    SELECT COUNT(*) INTO v_check
    FROM SINHVIEN
    WHERE MASV = p_student_id;

    IF v_check = 0 THEN
        RETURN NULL;
    END IF;

    -- Tinh tong hoc phi
    SELECT NVL(SUM(mh.HOCPHI), 0)
    INTO v_total
    FROM DANGKY dk
    JOIN LOPHOC lh ON dk.MALOP = lh.MALOP
    JOIN MONHOC mh ON lh.MAMH = mh.MAMH
    WHERE dk.MASV = p_student_id;

    RETURN v_total;

EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END Total_cost_for_student;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Tong chi phi: ' || Total_cost_for_student(201));
END;
/

-- 4b: Trigger Audit (Them SYS. vao ten bang)
CREATE OR REPLACE TRIGGER trg_monhoc_audit
BEFORE INSERT OR UPDATE ON SYS.MONHOC
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.NGUOITAO := USER;
        :NEW.NGAYTAO := SYSDATE;
    END IF;
    :NEW.NGUOISUA := USER;
    :NEW.NGAYSUA := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_lophoc_audit
BEFORE INSERT OR UPDATE ON SYS.LOPHOC
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.NGUOITAO := USER;
        :NEW.NGAYTAO := SYSDATE;
    END IF;
    :NEW.NGUOISUA := USER;
    :NEW.NGAYSUA := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_sinhvien_audit
BEFORE INSERT OR UPDATE ON SYS.SINHVIEN
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.NGUOITAO := USER;
        :NEW.NGAYTAO := SYSDATE;
    END IF;
    :NEW.NGUOISUA := USER;
    :NEW.NGAYSUA := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_giangvien_audit
BEFORE INSERT OR UPDATE ON SYS.GIANGVIEN
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.NGUOITAO := USER;
        :NEW.NGAYTAO := SYSDATE;
    END IF;
    :NEW.NGUOISUA := USER;
    :NEW.NGAYSUA := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_dangky_audit
BEFORE INSERT OR UPDATE ON SYS.DANGKY
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.NGUOITAO := USER;
        :NEW.NGAYTAO := SYSDATE;
    END IF;
    :NEW.NGUOISUA := USER;
    :NEW.NGAYSUA := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER trg_diem_audit
BEFORE INSERT OR UPDATE ON SYS.DIEM
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.NGUOITAO := USER;
        :NEW.NGAYTAO := SYSDATE;
    END IF;
    :NEW.NGUOISUA := USER;
    :NEW.NGAYSUA := SYSDATE;
END;
/

-- 4c: Trigger chặn đăng ký (Them SYS. vao ten bang)
CREATE OR REPLACE TRIGGER trg_max_dangky
BEFORE INSERT ON SYS.DANGKY
FOR EACH ROW
DECLARE
    v_so_lop NUMBER;
BEGIN
    -- Dem so lop sinh vien da dang ky
    SELECT COUNT(*)
    INTO v_so_lop
    FROM SYS.DANGKY
    WHERE MASV = :NEW.MASV;

    -- Neu >= 3 thi chan
    IF v_so_lop >= 3 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Sinh vien ' || :NEW.MASV ||
            ' da dang ky du 3 lop! Khong the dang ky them.'
        );
    END IF;
END;
/
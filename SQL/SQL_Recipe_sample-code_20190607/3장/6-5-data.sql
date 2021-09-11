DROP TABLE IF EXISTS mst_users_with_dates;
CREATE TABLE mst_users_with_dates (
    user_id        varchar(255)
  , register_stamp varchar(255)
  , birth_date     varchar(255)
);

INSERT INTO mst_users_with_dates
VALUES
    ('U001', '2016-02-28 10:00:00', '2000-02-29')
  , ('U002', '2016-02-29 10:00:00', '2000-02-29')
  , ('U003', '2016-03-01 10:00:00', '2000-02-29')
;

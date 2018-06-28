CREATE TABLE COUNTRY
(
  ID   SERIAL PRIMARY KEY NOT NULL,
  NAME VARCHAR(255)
);


CREATE TABLE HOTEL
(
  HOTEL_ID   SERIAL PRIMARY KEY NOT NULL,
  HOTEL_NAME VARCHAR(255)       NOT NULL,
  PHONE      VARCHAR(255),
  STARS      INTEGER,
  COUNTRY_ID INTEGER,
  CONSTRAINT HOTEL_COUNTRY_ID_FK FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRY (ID)
);


CREATE TABLE A_USER
(
  USER_ID  SERIAL PRIMARY KEY NOT NULL,
  LOGIN    VARCHAR(255)       NOT NULL,
  PASSWORD VARCHAR(255)       NOT NULL
);


CREATE TABLE TOUR
(
  TOUR_ID     SERIAL PRIMARY KEY NOT NULL,
  DESCRIPTION VARCHAR(255),
  COST        NUMERIC(15, 2),

  COUNTRY_ID  INTEGER            NOT NULL,
  HOTEL_ID    INTEGER            NOT NULL,
  TYPE        INTEGER            NOT NULL,
  PHOTO       VARCHAR(255),
  DATE        TIMESTAMP,
  DURATION    INTEGER,
  CONSTRAINT TOUR_COUNTRY_ID_FK FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRY (ID),
  CONSTRAINT TOUR_HOTEL_HOTEL_ID_FK FOREIGN KEY (HOTEL_ID) REFERENCES HOTEL (HOTEL_ID)
);

CREATE TABLE A_ORDER
(
  ORDER_ID SERIAL PRIMARY KEY                 NOT NULL,
  AMT      INTEGER DEFAULT 1                  NOT NULL,
  USER_ID  INTEGER                            NOT NULL,
  TOUR_ID  INTEGER                            NOT NULL,
  CONSTRAINT A_ORDER_TOUR_TOUR_ID_FK FOREIGN KEY (TOUR_ID) REFERENCES TOUR (TOUR_ID),
  CONSTRAINT A_ORDER_A_USER_USER_ID_FK FOREIGN KEY (USER_ID) REFERENCES A_USER (USER_ID)
);


CREATE TABLE REVIEW
(
  REVIEW_ID SERIAL PRIMARY KEY NOT NULL,
  CONTENT   VARCHAR(255),
  TOUR_ID   INTEGER            NOT NULL,
  USER_ID   INTEGER            NOT NULL,
  CONSTRAINT REVIEW_TOUR_TOUR_ID_FK FOREIGN KEY (TOUR_ID) REFERENCES TOUR (TOUR_ID),
  CONSTRAINT REVIEW_A_USER_USER_ID_FK FOREIGN KEY (USER_ID) REFERENCES A_USER (USER_ID)
);




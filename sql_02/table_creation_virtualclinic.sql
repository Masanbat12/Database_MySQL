use virtualclinic;

CREATE TABLE speciality(
    name VARCHAR(50),
    description VARCHAR(100)
);

CREATE TABLE symptom(
    name VARCHAR(50),
    description VARCHAR(100)
);

CREATE TABLE location(
    city VARCHAR(50),
    zip VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) DEFAULT "Israel",
    address VARCHAR(50)
);

CREATE TABLE doctors(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    speciality_name VARCHAR(50),
    location_city VARCHAR(50),
    experience_years INT
);
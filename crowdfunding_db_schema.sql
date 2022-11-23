-- Creating Entity Relationship Diagram

Campaign
-
    cf_id int PK
    contact_id int FK - Contacts.contact_id
    company_name varchar(100)
    description text
    goal numeric(10,2)
    pledged numeric(10,2)
    outcome varchar(50)
    backers_count int
    country varchar(10)
    currency varchar(10)
    launched_date date
    end_date date
    category_id varchar(10) FK >- Category.category_id
    subcategory_id varchar(10) FK >- Subcategory.subcategory_id

Category
-
    category_id varchar(10)
    category varchar(50)


Subcategory
-
    subcategory_id varchar(10)
    subcategory varchar(50)


Contacts
-
    contact_id int
    first_name varchar(50)
    last_name varchar(50)
    email varchar(100)

Backers
-
    backer_id varchar(10) PK
    cf_id int FK >- Campaign.cf_id
    first_name varchar(50)
    last_name varchar(50)
    email varchar(100)
    
-- Creating tables for Pewlett-Hackard-Analysis
CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "goal" numeric(10,2)   NOT NULL,
    "pledged" numeric(10,2)   NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "category" (
    "category_id" varchar(10)   NOT NULL,
    "category_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

-- Add the foreign key constraint
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

-- Creating tables for Pewlett-Hackard-Analysis
CREATE TABLE "backers" (
    "backer_id" varchar(10)   NOT NULL,
    "cf_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "email" varchar(100)   NOT NULL,
    PRIMARY KEY ("backer_id")
);

-- Add the foreign key constraint
ALTER TABLE "backers" ADD CONSTRAINT "fk_backers_cf_id" FOREIGN KEY("cf_id")
REFERENCES "campaign" ("cf_id");

-- Check the import
SELECT * FROM public."backers"
CREATE ROLE ricksoft WITH LOGIN PASSWORD 'ricksoft';

CREATE DATABASE jira OWNER ricksoft;
CREATE DATABASE confluence OWNER ricksoft;
CREATE DATABASE alfresco OWNER ricksoft;

alter table RequestInfo add priority int;
ALTER TABLE ProcessInstanceLog ADD processType int;

update ProcessInstanceLog set processType = 1;
update RequestInfo set priority = 5;

create table CaseIdInfo (
    id bigint identity not null,
    caseIdPrefix varchar(255) null,
    currentValue bigint null,
    primary key (id)
) lock datarows;

create table CaseRoleAssignmentLog (
    id bigint identity not null,
    caseId varchar(255) null,
    entityId varchar(255) null,
    processInstanceId bigint not null,
    roleName varchar(255) null,
    type int not null,
    primary key (id)
) lock datarows;

alter table CaseIdInfo 
    add constraint UK_CaseIdInfo_1 unique (caseIdPrefix);

ALTER TABLE NodeInstanceLog ADD COLUMN referenceId bigint null;
ALTER TABLE NodeInstanceLog ADD COLUMN nodeContainerId varchar(255) null;    
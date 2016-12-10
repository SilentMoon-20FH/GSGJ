/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/12/10 11:30:58                          */
/*==============================================================*/


drop table if exists Reserve;

drop table if exists Users;

drop table if exists Venue;

drop table if exists VenueGen;

drop table if exists VenueType;

/*==============================================================*/
/* Table: Reserve                                               */
/*==============================================================*/
create table Reserve
(
   users_id             int not null,
   venue_id             int not null,
   reserve_date         date not null,
   reserve_time         time not null,
   reserve_area         int not null,
   primary key (users_id, venue_id)
);

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users
(
   users_id             int not null auto_increment,
   users_account        varchar(20) not null,
   users_name           varchar(20),
   users_password       varchar(20) not null,
   users_admin          tinyint not null,
   users_sumhour        int,
   primary key (users_id)
);

/*==============================================================*/
/* Table: Venue                                                 */
/*==============================================================*/
create table Venue
(
   venue_id             int not null auto_increment,
   venuegen_id          int,
   venue_name           varchar(50) not null,
   venue_addr           varchar(50) not null,
   venue_opentime       time not null,
   venue_closetime      time not null,
   venue_sumarea        int not null,
   venue_maxnum         int not null,
   venue_isopen         smallint not null,
   venue_notice         text,
   primary key (venue_id)
);

/*==============================================================*/
/* Table: VenueGen                                              */
/*==============================================================*/
create table VenueGen
(
   venuegen_id          int not null auto_increment,
   venuetype_id         int,
   venuegen_name        varchar(50) not null,
   primary key (venuegen_id)
);

/*==============================================================*/
/* Table: VenueType                                             */
/*==============================================================*/
create table VenueType
(
   venuetype_id         int not null auto_increment,
   venuetype_name       varchar(50) not null,
   primary key (venuetype_id)
);

alter table Reserve add constraint FK_Relationship_3 foreign key (users_id)
      references Users (users_id) on delete restrict on update restrict;

alter table Reserve add constraint FK_Relationship_4 foreign key (venue_id)
      references Venue (venue_id) on delete restrict on update restrict;

alter table Venue add constraint FK_Relationship_2 foreign key (venuegen_id)
      references VenueGen (venuegen_id) on delete restrict on update restrict;

alter table VenueGen add constraint FK_Relationship_1 foreign key (venuetype_id)
      references VenueType (venuetype_id) on delete restrict on update restrict;


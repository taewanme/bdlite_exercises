sqlplus /nolog << EOF
connect BDA/welcome1@orcl
select * from books;
exit;

EOF


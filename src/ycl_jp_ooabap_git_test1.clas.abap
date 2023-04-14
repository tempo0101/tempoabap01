CLASS ycl_jp_ooabap_git_test1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: ty_name TYPE c LENGTH 20,
           ty_date TYPE c LENGTH 10,
           ty_time TYPE c LENGTH 08.

    INTERFACES if_oo_adt_classrun.

    METHODS:

      get_values EXPORTING ev_name TYPE ty_name
                           ev_date TYPE ty_date
                           ev_time TYPE ty_time.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS: co_name TYPE c LENGTH 20 VALUE 'Some Name',
               co_date TYPE c LENGTH 10 VALUE 'dd.mm.yyyy',
               co_time TYPE c LENGTH 08 VALUE 'hh:mm:ss'.

ENDCLASS.



CLASS ycl_jp_ooabap_git_test1 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lv_out TYPE i.

    CALL FUNCTION 'Y_JP_FM_TEST'
      EXPORTING
        p_input1  = 10
        p_input2  = 15
      IMPORTING
        ev_output = lv_out.

    me->get_values(
      IMPORTING
        ev_name = DATA(lv_name)
        ev_date = DATA(lv_date)
        ev_time = DATA(lv_time)
    ).

    out->write(
      EXPORTING
        data   = | { lv_name } { lv_date } { lv_time } { lv_out } |
    ).

  ENDMETHOD.
  METHOD get_values.
    ev_name = co_name.
    ev_date = co_date.
    ev_time = co_time.

  ENDMETHOD.


ENDCLASS.

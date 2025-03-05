CLASS LHC_ZR_CON_WEB DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrConWeb
        RESULT result,
      validateConsent FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrConWeb~validateConsent.
ENDCLASS.

CLASS LHC_ZR_CON_WEB IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD validateConsent.

    READ ENTITIES OF zr_con_web IN LOCAL MODE
        ENTITY ZrConWeb
        FIELDS ( ConsentGiven ) WITH CORRESPONDING #( keys )
        RESULT DATA(consent_given).

    LOOP AT consent_given ASSIGNING FIELD-SYMBOL(<l_consent_given>).
        if NOT (  <l_consent_given>-ConsentGiven = abap_false or <l_consent_given>-ConsentGiven = abap_true ).
          APPEND VALUE #( %tky = <l_consent_given>-%tky ) to failed-zrconweb.

          APPEND VALUE #(  %tky = keys[ 1 ]-%tky
                            %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                            text = 'Consent values allowed X or EMPTY' ) )
          to reported-zrconweb.
        endif.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

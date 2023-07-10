*** Settings ***
Suite Setup   Connect  192.168.211.126    1884
Suite Teardown    Disconnect
Library    SeatPosition.py
Library    MQTTLibrary


*** Test Cases ***
Test SeatPosition move 1
    Publish    topic=sampleapp/setPosition    message={"position":1}
    Sleep    1
    Result Should Be    02 01 00 00 00 00 00 00

Test SeatPosition move 2
    Publish    sampleapp/setPosition     {"position":2}
    Sleep    1
    Result Should Be    02 02 00 00 00 00 00 00

Test SeatPosition move 3
    Publish    sampleapp/setPosition     {"position":3}
    Sleep    1
    Result Should Be    02 03 00 00 00 00 00 00

Test SeatPosition move 4
    Publish    sampleapp/setPosition     {"position":4}
    Sleep    1
    Result Should Be    02 04 00 00 00 00 00 00

Test SeatPosition move 5
    Publish    sampleapp/setPosition     {"position":5}
    Sleep    1
    Result Should Be    02 05 00 00 00 00 00 00

Test SeatPosition move 6
    Publish    sampleapp/setPosition     {"position":6}
    Sleep    1
    Result Should Be    02 06 00 00 00 00 00 00

Test SeatPosition move 7
    Publish    sampleapp/setPosition     {"position":7}
    Sleep    1
    Result Should Be    02 07 05 00 00 00 00 00

Test SeatPosition move 8
    Publish    sampleapp/setPosition     {"position":8}
    Sleep    1
    Result Should Be    02 08 00 00 00 00 00 00

Test SeatPosition move 9
    Publish    sampleapp/setPosition     {"position":9}
    Sleep    1
    Result Should Be    02 09 00 00 00 00 00 00
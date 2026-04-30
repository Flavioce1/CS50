-- Keep a log of any SQL queries you execute as you solve the mystery.
-- Crime scene report for July 28, 2025 on Humphrey Street
SELECT description FROM crime_scene_reports
WHERE year = 2025 AND month = 7 AND day = 28
AND street = 'Humphrey Street';

-- Interviews from that day mentioning the bakery
SELECT name, transcript FROM interviews
WHERE year = 2025 AND month = 7 AND day = 28
AND transcript LIKE '%bakery%';

-- People who left the bakery parking lot between 10:15 and 10:25
SELECT name FROM people
WHERE license_plate IN (
    SELECT license_plate FROM bakery_security_logs
    WHERE year = 2025 AND month = 7 AND day = 28
    AND hour = 10
    AND minute BETWEEN 15 AND 25
    AND activity = 'exit'
);

-- People who withdrew money at the Leggett Street ATM that day
SELECT name FROM people
WHERE id IN (
    SELECT person_id FROM bank_accounts
    WHERE account_number IN (
        SELECT account_number FROM atm_transactions
        WHERE year = 2025 AND month = 7 AND day = 28
        AND atm_location = 'Leggett Street'
        AND transaction_type = 'withdraw'
    )
);

-- People who made a phone call shorter than 60 seconds that day
SELECT name FROM people
WHERE phone_number IN (
    SELECT caller FROM phone_calls
    WHERE year = 2025 AND month = 7 AND day = 28
    AND duration < 60
);

-- Earliest flight out of Fiftyville on July 29, 2025
SELECT * FROM flights
WHERE year = 2025 AND month = 7 AND day = 29
AND origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville')
ORDER BY hour ASC, minute ASC
LIMIT 1;

-- Passengers on that flight
SELECT name FROM people
WHERE passport_number IN (
    SELECT passport_number FROM passengers
    WHERE flight_id = (
        SELECT id FROM flights
        WHERE year = 2025 AND month = 7 AND day = 29
        AND origin_airport_id = (SELECT id FROM airports WHERE city = 'Fiftyville')
        ORDER BY hour ASC, minute ASC
        LIMIT 1
    )
);

-- Destination city of that flight
SELECT city FROM airports WHERE id = 4;

-- Person Bruce called in a sub-60-second phone call that day
SELECT name FROM people
WHERE phone_number IN (
    SELECT receiver FROM phone_calls
    WHERE year = 2025 AND month = 7 AND day = 28
    AND duration < 60
    AND caller = (SELECT phone_number FROM people WHERE name = 'Bruce')
);

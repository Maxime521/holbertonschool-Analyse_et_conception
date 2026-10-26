sequenceDiagram
    autonumber
    participant Client
    participant API
    participant Database
    participant MessageQueue
    participant Worker
    participant Bank

    Client->>API: POST /payments (Payer)
    API->>Database: Update status = PENDING_PAYMENT
    API-xMessageQueue: ProcessPaymentEvent (Asynchrone)
    API-->>Client: HTTP 202 Accepted

    Note over MessageQueue, Worker: Traitement asynchrone découpé
    MessageQueue->>Worker: Consume ProcessPaymentEvent
    Worker->>Bank: Process payment (Synchrone)

    alt Banque OK
        Bank-->>Worker: Payment OK
        Worker->>Database: Update status = PAID
    else Banque KO
        Bank-->>Worker: Payment Refused
        Worker->>Database: Update status = FAILED
    end

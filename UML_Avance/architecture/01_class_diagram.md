classDiagram
    class IOrderRepository {
        <<interface>>
        +save(order: Order) void
        +findById(id: UUID) Order
    }

    class PostgresOrderRepository {
        +save(order: Order) void
        +findById(id: UUID) Order
    }

    class OrderService {
        -orderRepository: IOrderRepository
    }

    class Order {
        -id: UUID
    }

    PostgresOrderRepository ..|> IOrderRepository
    OrderService o-- IOrderRepository
#if os(macOS) || os(iOS) || os(tvOS)
public struct StorableInUbiquitousKeyValueStoreTransformer<Input: StorableInUbiquitousKeyValueStore>: Transformer {

    public func transformValue(_ value: Input) -> UbiquitousKeyValueStoreValue {
        return value.asUbiquitousKeyValueStoreValue
    }

    public func untransformValue(_ output: UbiquitousKeyValueStoreValue) throws -> Input {
        guard let value = output.value as? Input else {
            throw PersistanceError.unexpectedValueType(value: output.value, expected: Input.self)
        }

        return value
    }

}
#endif

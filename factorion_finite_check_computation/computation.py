import math

def run(input_data, target):
    upper = input_data['upper_bound']
    expected = set(target['expected_set'])
    FACT = [math.factorial(d) for d in range(10)]
    factorions = []
    for n in range(1, upper + 1):
        if sum(FACT[int(d)] for d in str(n)) == n:
            factorions.append(n)
    found_set = set(factorions)
    sufficient = found_set == expected
    summary = (
        f"Scanned integers 1..{upper}. "
        f"Factorions found: {sorted(found_set)}. "
        f"Expected: {sorted(expected)}. "
        f"Match: {sufficient}."
    )
    return {
        'evidence': {
            'upper_bound': upper,
            'factorions_found': sorted(found_set),
            'expected': sorted(expected),
            'count_checked': upper
        },
        'sufficient': sufficient,
        'summary': summary
    }

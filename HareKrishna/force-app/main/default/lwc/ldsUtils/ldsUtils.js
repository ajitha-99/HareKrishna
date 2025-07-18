/**
 * Reduces one or more LDS errors into a string[] of error messages.
 */
export function reduceErrors(errors) {
    if (!Array.isArray(errors)) {
        errors = [errors];
    }

    return (
        errors
            .filter(error => !!error)
            .map(error => {
                if (Array.isArray(error.body)) {
                    return error.body.map(e => e.message);
                } else if (error.body && typeof error.body.message === 'string') {
                    return error.body.message;
                } else if (typeof error.message === 'string') {
                    return error.message;
                }
                return 'Unknown error';
            })
            .reduce((prev, curr) => prev.concat(curr), [])
            .filter(message => !!message)
    );
}
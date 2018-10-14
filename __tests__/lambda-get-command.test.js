import quoteStore from '../src/quote-store';
import lambdaGetCommand from '../src/lambda-get-command';

describe('The lambdaGetCommand execute', () => {
    it('should make a call to quoteStore for the quote list', () => {
        quoteStore.readQuotes = jest.fn();
        quoteStore.readQuotes.mockReturnValueOnce(['quote1', 'quote2', 'quote3'])
        lambdaGetCommand.execute();

        expect(quoteStore.readQuotes).toBeCalledTimes(1);
    });
})

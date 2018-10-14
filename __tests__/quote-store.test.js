import quoteStore from '../src/quote-store';

describe('The readQuotes method', () => {
    it('should return a non-empty list', () => {
        expect(quoteStore.readQuotes().length).toBeGreaterThan(5);
    });
})

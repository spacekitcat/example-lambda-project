import quoteStore from './quote-store';

const execute = () => {
    const sourceQuotes = quoteStore.readQuotes();

    return ({
        statusCode: 200,
        body: JSON.stringify({
            message: sourceQuotes[ Math.floor(Math.random() * sourceQuotes.length)]
        })
    });
}

export default { execute };

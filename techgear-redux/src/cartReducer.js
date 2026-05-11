const initialState = []; // Certifique-se que são colchetes [ ] e não chaves { }

const cartReducer = (state = initialState, action) => {
  switch (action.type) {
    case "ADD_TO_CART":
      return [...state, action.payload];
    // ... outros cases
    default:
      return state;
  }
};

export default cartReducer;
import Typed from 'typed.js';
const initTypedJs = () => {
 if (document.querySelector('#typing')) {
   new Typed('#typing', {
    strings: ['For my project I need','For my project I need a hammer','For my project I need a screwdriver','For my project I need a drill'],
    typeSpeed: 40,
    backSpeed: 75,
    showCursor: true,
    smartBackspace: true
    });
  }
};

export { initTypedJs };

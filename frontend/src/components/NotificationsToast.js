import { useToasts } from 'react-toast-notifications';

export const useSuccessNotification = () => {
    const { addToast } = useToasts();

    const successNotification = (message) => {
        
        addToast(message, { appearance: 'success'});
    };

    return { successNotification };
};

export const successNotificationNotAuto = () => {
    const { addToast } = useToasts();
    addToast(message, { appearance: 'success', autoDismiss: true });
    return { successNotificationNotAuto };
};


// example

// return (
//     <div>
//     <button onClick={showNotification}>Show Notification</button>
//     </div>
//     );
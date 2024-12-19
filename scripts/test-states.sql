-- Insert default states

CALL bar_rest.CreateState('active');
CALL bar_rest.CreateState('disabled');
CALL bar_rest.CreateState('pending');
CALL bar_rest.CreateState('canceled');
CALL bar_rest.CreateState('voided');
CALL bar_rest.CreateState('banned');

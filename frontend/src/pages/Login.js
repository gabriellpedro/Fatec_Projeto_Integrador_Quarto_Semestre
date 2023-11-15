import * as React from 'react';
import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import { Link } from 'react-router-dom';


function Login() {
  const [username, setUsername] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [additionalData, setAdditionalData] = React.useState('');
  const [isRegistering, setRegistering] = React.useState(false);

  const handleFormSubmit = (e) => {
    e.preventDefault();

    if (isRegistering) {
      console.log('Dados de cadastro enviados:', { username, password, additionalData });

    } else {
      console.log('Dados de login enviados:', { username, password });

    }
  };

  return (
    <Box
      component="form"
      sx={{
        '& .MuiTextField-root': { m: 1, width: '25ch' },
      }}
      onSubmit={handleFormSubmit}
      noValidate
      autoComplete="off"
    >
      <Typography variant="h5">{isRegistering ? 'Cadastro' : 'Login'}</Typography>
      <div>
        <TextField
          required
          id="standard-username"
          label="Nome de Usuário"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          variant="standard"
        />
        <TextField
          required
          id="standard-password"
          label="Senha"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          variant="standard"
        />
        {isRegistering && (
          <TextField
            required
            id="standard-additional-data"
            label="Dados Adicionais"
            value={additionalData}
            onChange={(e) => setAdditionalData(e.target.value)}
            variant="standard"
          />
        )}
      </div>
      <Button type="submit" variant="contained" color="primary">
        {isRegistering ? 'Cadastrar' : 'Entrar'}
      </Button>
      <Typography variant="body2">
        {isRegistering
          ? 'Já tem uma conta?'
          : 'Ainda não tem uma conta?'}
        <Link
          to={isRegistering ? '/login' : '/entry'}
          onClick={() => setRegistering(!isRegistering)}
        >
          {isRegistering ? 'Entrar' : 'Cadastrar'}
        </Link>
      </Typography>
    </Box>
  );
}

export default Login;
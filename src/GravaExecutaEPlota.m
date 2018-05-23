while 1
    Fs = 8000; % Frequ�ncia de amostragem
    nBits = 8; % Quantidade de bits por amostra
    t = 5; % faixa de grava��o e atualiza��o em segundos
    recObj = audiorecorder(Fs, nBits, 1);
    disp('Iniciando a grava��o.')
    recordblocking(recObj, t); % janelamento 
    disp('Grava��o finalizada.');
    myRecording = getaudiodata(recObj); % armazena o �udio em um vetor
        
    subplot(3,1,1)
    T = 0: 1/Fs: t-(1/Fs); %gera os tempos das amostras 
    stem(T, myRecording,'.')  %plota o sinal discreto
    xlabel('t(s)')
    ylabel('x(t)')
    title('Amplitude X Tempo')
   
    xw = fft(myRecording);
    modulo = abs(xw);
    N = length(myRecording);
    faixa = [0:N-1];
    faixaA = faixa*Fs/N;
    
    subplot(3,1,2)
    axis auto;
    stem(faixaA, modulo, '.');
    xlabel('f(Hz)')
    ylabel('|x(w)|');
    title('Magnitude X Frequ�ncia')
    
    subplot(3,1,3)
    faixa = [(-(N-1))/2:(N-1)/2];
    faixaA = faixa*Fs/N;
    stem(faixaA, fftshift(modulo), '.');
    xlabel('f(Hz)')
    ylabel('|x(w)|');
    title('Magnitude X Frequ�ncia') 
end

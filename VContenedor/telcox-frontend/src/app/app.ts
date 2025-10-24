import { Component } from '@angular/core';
import { ConsultaSaldoComponent } from './consulta-saldo/consulta-saldo';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [ConsultaSaldoComponent],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {}

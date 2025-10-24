import { Component, inject, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient, HttpClientModule } from '@angular/common/http';

@Component({
  selector: 'app-consulta-saldo',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './consulta-saldo.html',
  styleUrl: './consulta-saldo.css'
})
export class ConsultaSaldoComponent {
  private http = inject(HttpClient);
  private cdr = inject(ChangeDetectorRef);

  identificacion = '';
  resultado: any = null;
  cargando = false;
  error = '';
  bloqueado = false;

  consultar() {
    this.error = '';
    if (!this.identificacion.trim()) return;

    this.cargando = true;
    this.resultado = null;

    this.http.get(`http://127.0.0.1:8000/api/cliente/${this.identificacion}`)
      .subscribe({
        next: (data: any) => {
          this.resultado = data;
          this.cargando = false;
          this.bloqueado = true;
          this.cdr.detectChanges();
        },
        error: (err) => {
          console.error('Error al consultar:', err);
          this.error = 'No se pudo obtener la información. Verifica el número o el servidor.';
          this.cargando = false;
          this.cdr.detectChanges();
        }
      });
  }

  nuevaConsulta() {
    this.identificacion = '';
    this.resultado = null;
    this.error = '';
    this.cargando = false;
    this.bloqueado = false;
    this.cdr.detectChanges();
  }
}

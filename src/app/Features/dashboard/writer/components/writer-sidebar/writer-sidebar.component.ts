// writer-sidebar.component.ts
import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-writer-sidebar',
  templateUrl: './writer-sidebar.component.html',
})
export class WriterSidebarComponent {
  @Output() sectionChanged = new EventEmitter<string>();

  selectSection(section: string) {
    this.sectionChanged.emit(section);
  }
}

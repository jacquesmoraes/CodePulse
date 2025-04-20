import { Component, Input, Output, EventEmitter, OnInit, OnChanges, SimpleChanges, ViewEncapsulation } from '@angular/core';
import { Router } from '@angular/router';
import {
  ApexAxisChartSeries,
  ApexChart,
  ApexXAxis,
  ApexDataLabels,
  ApexTitleSubtitle
} from 'ng-apexcharts';
import { BlogPost } from 'src/app/Features/blog-post/models/blog-post.model';

export type ChartOptions = {
  series: ApexAxisChartSeries;
  chart: ApexChart;
  xaxis: ApexXAxis;
  dataLabels: ApexDataLabels;
  title: ApexTitleSubtitle;
};

@Component({
  selector: 'app-writer-posts',
  templateUrl: './writer-posts.component.html',
  encapsulation: ViewEncapsulation.None,
})
export class WriterPostsComponent implements OnInit, OnChanges {
  @Input() posts: BlogPost[] = [];
  @Output() viewAllPosts = new EventEmitter<void>();

  public chartOptions: Partial<ChartOptions> = {
    series: [{
      name: 'Visualizações',
      data: []
    }],
    chart: { 
      type: 'bar', 
      height: 350 
    },
    xaxis: { 
      categories: [] 
    },
    dataLabels: { 
      enabled: false 
    },
    title: { 
      text: 'Top 5 Posts Mais Visualizados' 
    }
  };

  constructor(private router: Router) {}

  ngOnInit(): void {
    
    if (this.posts.length > 0) {
      this.updateChartOptions();
    }
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['posts'] && this.posts.length > 0) {
      
      this.updateChartOptions();
    }
  }

  private updateChartOptions(): void {
    const topViewed = [...this.posts]
      .sort((a, b) => b.viewCount - a.viewCount)
      .slice(0, 5);

    

    this.chartOptions = {
      series: [
        {
          name: 'Visualizações',
          data: topViewed.map(p => p.viewCount),
        },
      ],
      chart: {
        type: 'bar',
        height: 350,
      },
      title: {
        text: 'Top 5 Posts Mais Visualizados',
      },
      xaxis: {
        categories: topViewed.map(p => p.title),
        labels: {
          style: {
            fontSize: '12px'
          }
        }
      },
      dataLabels: {
        enabled: true,
      },
    };

    
  }

  addPost(): void {
    this.router.navigateByUrl('/dashboard/add');
  }

  goToPosts(): void {
    this.viewAllPosts.emit();
  }

  get latestPosts(): BlogPost[] {
    return [...this.posts]
      .sort((a, b) => new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime())
      .slice(0, 5);
  }

  get totalPosts(): number {
    return this.posts.length;
  }

  get isChartReady(): boolean {
    return this.posts.length > 0 && 
           this.chartOptions.series !== undefined && 
           this.chartOptions.series[0].data.length > 0;
  }
}
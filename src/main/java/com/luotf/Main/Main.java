package com.luotf.Main;

import java.util.concurrent.CountDownLatch;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import com.luotf.model.Blog;
import com.luotf.service.BlogService;

/**
 * 测试系统的并发量
 * @author Administrator
 *
 */
public class Main {
  ApplicationContext ac =
      new FileSystemXmlApplicationContext("classpath:spring/applicationContext-*.xml");
  BlogService blogService = ac.getBean(BlogService.class);

  private void testThread() throws InterruptedException {
    final CountDownLatch startGate = new CountDownLatch(1);
    final CountDownLatch endGate = new CountDownLatch(100);
    for (int i = 0; i < 20; i++) {
      new Thread("" + i) {
        public void run() {
          try {
            startGate.await();
          } catch (InterruptedException e) {
            e.printStackTrace();
          }
          Blog blog = blogService.selectBlogById(95);
          System.out.println(Thread.currentThread().getName() + "-" + blog.getClicknum());
          endGate.countDown();// 任务执行完毕,计数器减1;
        }
      }.start();
      // Thread.sleep(100);
    }
    long start = System.nanoTime();
    startGate.countDown(); // 到此处,说明所有线程准备就绪,可以开始执行任务
    endGate.await();// 阻塞等待所有线程执行完毕.
    long end = System.nanoTime();
    System.out.println((end - start) + " ns");
  }

  public static void main(String[] args) {
    //new Main().testThread();
  }
}

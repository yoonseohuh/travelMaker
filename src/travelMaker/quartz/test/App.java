package travelMaker.quartz.test;

import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;
import static org.quartz.CronScheduleBuilder.cronSchedule;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;

public class App {
	
	public static void main(String[] args) {
		
        // SchedulerFactory Create
        SchedulerFactory schedulerFactory = new StdSchedulerFactory();
        try {
            Scheduler scheduler = schedulerFactory.getScheduler();

            JobDetail job = newJob(SchedulerTest.class).withIdentity("jobName", Scheduler.DEFAULT_GROUP).build();

            // 5 seconds action
            Trigger trigger = newTrigger().withIdentity("trggerName", Scheduler.DEFAULT_GROUP)
                    .withSchedule(cronSchedule("0/5 * * * * ?")).build();

            scheduler.scheduleJob(job, trigger);
            scheduler.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Final_ProjectWeb_Mohamad_Nour.Models;

namespace Final_ProjectWeb_Mohamad_Nour.Controllers
{
    public class RegistrationsController : Controller
    {
        private Employee2021Entities db = new Employee2021Entities();

        // GET: Registrations
        public ActionResult Index()
        {
            Authenticate("/Registrations");
            var registrations = db.registrations.Include(r => r.group).Include(r => r.job);
            return View(registrations.ToList());
        }

        // GET: Registrations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            registration registration = db.registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            return View(registration);
        }

        // GET: Registrations/Create
        public ActionResult Create()
        {
            ViewBag.group_id = new SelectList(db.groups, "id", "group_number");
            ViewBag.job_id = new SelectList(db.jobs, "id", "position");
            return View();
        }

        // POST: Registrations/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,firstname,lastname,identification_number,job_id,group_id,mobile_number,email_ad")] registration registration)
        {
            if (ModelState.IsValid)
            {
                db.registrations.Add(registration);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.group_id = new SelectList(db.groups, "id", "group_number", registration.group_id);
            ViewBag.job_id = new SelectList(db.jobs, "id", "position", registration.job_id);
            return View(registration);
        }

        // GET: Registrations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            registration registration = db.registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            ViewBag.group_id = new SelectList(db.groups, "id", "group_number", registration.group_id);
            ViewBag.job_id = new SelectList(db.jobs, "id", "position", registration.job_id);
            return View(registration);
        }

        // POST: Registrations/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,firstname,lastname,identification_number,job_id,group_id,mobile_number,email_ad")] registration registration)
        {
            if (ModelState.IsValid)
            {
                db.Entry(registration).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.group_id = new SelectList(db.groups, "id", "group_number", registration.group_id);
            ViewBag.job_id = new SelectList(db.jobs, "id", "position", registration.job_id);
            return View(registration);
        }

        // GET: Registrations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            registration registration = db.registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            return View(registration);
        }

        // POST: Registrations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            registration registration = db.registrations.Find(id);
            db.registrations.Remove(registration);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }


        private void Authenticate(string returnUrl)
        {
            HttpCookie cookie = Request.Cookies["AuthCookie"];
            if (cookie == null)
            {
                Response.Redirect("/Login/Index?ReturnUrl=" + returnUrl);
            }
        }

    }
}

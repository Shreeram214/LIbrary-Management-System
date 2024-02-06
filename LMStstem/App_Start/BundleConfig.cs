using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace LMStstem.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                       "~/Content/ThemeFiles/plugins/bootstrap/js/bootstrap.bundle.min.js",
                       "~/Content/ThemeFiles/plugins/select2/js/select2.full.min.js",
                       "~/Content/ThemeFiles/plugins/jquery-ui/jquery-ui.min.js",
                      "~/Content/ThemeFiles/plugins/chart.js/Chart.min.js",
                      "~/Content/ThemeFiles/plugins/moment/moment.min.js",
                      "~/Content/ThemeFiles/plugins/daterangepicker/daterangepicker.js",
                      "~/Content/ThemeFiles/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js",
                      "~/Content/ThemeFiles/plugins/summernote/summernote-bs4.min.js",
                      "~/Content/ThemeFiles/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js",
                      "~/Content/ThemeFiles/dist/js/adminlte.js",
                      "~/Content/ThemeFiles/dist/js/demo.js",
                      "~/Content/ThemeFiles/plugins/datatables/jquery.dataTables.js",
                      "~/Content/ThemeFiles/plugins/datatables-bs4/js/dataTables.bootstrap4.js",
                      "~/Content/ThemeFiles/bootstrap-datepicker.min.js",
                      "~/Content/ThemeFiles/plugins/bs-custom-file-input/bs-custom-file-input.min.js",
                      "~/Content/ThemeFiles/plugins/sweetalert2/sweetalert2.min.js",
                      "~/Content/ThemeFiles/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/ThemeFiles/plugins/fontawesome-free/css/all.min.css",
                      "~/Content/ThemeFiles/plugins/font-awesome/css/font-awesome.min.css",
                      "~/Content/ThemeFiles/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css",
                      "~/Content/ThemeFiles/plugins/select2/css/select2.min.css",
                      "~/Content/ThemeFiles/plugins/icheck-bootstrap/icheck-bootstrap.min.css",
                      "~/Content/ThemeFiles/plugins/jqvmap/jqvmap.min.css",
                      "~/Content/ThemeFiles/dist/css/adminlte.min.css",
                      "~/Content/ThemeFiles/plugins/overlayScrollbars/css/OverlayScrollbars.min.css",
                      "~/Content/ThemeFiles/plugins/daterangepicker/daterangepicker.css",
                      "~/Content/ThemeFiles/plugins/summernote/summernote-bs4.css",
                      "~/Content/ThemeFiles/plugins/datatables-bs4/css/dataTables.bootstrap4.css",
                      "~/Content/ThemeFiles/font-awesome.min.css",
                      "~/Content/ThemeFiles/bootstrap-datepicker.min.css",
                      "~/Content/ThemeFiles/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css",
                     "~/Content/ThemeFiles/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css",
                      "~/fonts/flaticon.css",
                      "~/Content/customTheme.css"
                       ));
        }
    }
}
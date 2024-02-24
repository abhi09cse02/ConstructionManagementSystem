package com.practise.construction.management.utils;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

/**
 * Servlet implementation class Report
 */
public class ProjectDetailedReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProjectDetailedReport() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		OutputStream out = response.getOutputStream();
		try {
			Document document = new Document();
			/* Basic PDF Creation inside servlet */
			PdfWriter.getInstance(document, out);
			document.open();
			PdfPTable table = new PdfPTable(1); // 3 columns.
			

			PdfPCell cell1 = new PdfPCell(new Paragraph("Construction Management System"));
			cell1.setBorder(Rectangle.NO_BORDER);
			/* cell1.setBackgroundColor(Color.red); */
			cell1.setPaddingLeft(10);
			cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);

			PdfPCell cell2 = new PdfPCell(new Paragraph("Project Detailed Report"));
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			table.addCell(cell1);
			table.addCell(cell2);

			PdfPTable table2 = new PdfPTable(6);
			table2.setSpacingBefore(20f);
			PdfPCell h1 = new PdfPCell(new Paragraph("Project Id"));
			/*h1.setBorder(Rectangle.NO_BORDER);*/
			h1.setBackgroundColor(Color.white);
			h1.setPaddingLeft(10);
			h1.setHorizontalAlignment(Element.ALIGN_CENTER);
			h1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h2 = new PdfPCell(new Paragraph("Contractor Id"));
			
			h2.setBackgroundColor(Color.white);
			h2.setPaddingLeft(10);
			h2.setHorizontalAlignment(Element.ALIGN_CENTER);
			h2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h3 = new PdfPCell(new Paragraph("Project Name"));
			
			h3.setBackgroundColor(Color.white);
			h3.setPaddingLeft(10);
			h3.setHorizontalAlignment(Element.ALIGN_CENTER);
			h3.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h4 = new PdfPCell(new Paragraph("Customer Name"));
			
			h4.setBackgroundColor(Color.white);
			h4.setPaddingLeft(10);
			h4.setHorizontalAlignment(Element.ALIGN_CENTER);
			h4.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h5 = new PdfPCell(new Paragraph("Customer Mobile"));
			
			h5.setBackgroundColor(Color.white);
			h5.setPaddingLeft(10);
			h5.setHorizontalAlignment(Element.ALIGN_CENTER);
			h5.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h6 = new PdfPCell(new Paragraph("Budget"));
			
			h6.setBackgroundColor(Color.white);
			h6.setPaddingLeft(10);
			h6.setHorizontalAlignment(Element.ALIGN_CENTER);
			h6.setVerticalAlignment(Element.ALIGN_MIDDLE);

			table2.addCell(h1);
			table2.addCell(h2);
			table2.addCell(h3);
			table2.addCell(h4);
			table2.addCell(h5);
			table2.addCell(h6);

			Connection con = DbConUtil.getConnection();
			PreparedStatement pre;
			try {
				pre = con.prepareStatement("select * from project");

				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					PdfPCell pid = new PdfPCell(new Paragraph(rs.getString("pid")));
					table2.addCell(pid);
					PdfPCell conid = new PdfPCell(new Paragraph(rs.getString("conid")));
					table2.addCell(conid);
					PdfPCell pname = new PdfPCell(new Paragraph(rs.getString("pname")));
					table2.addCell(pname);
					PdfPCell customer_name = new PdfPCell(new Paragraph(rs.getString("customer_name")));
					System.out.println(rs.getString("customer_name"));
					table2.addCell(customer_name);
					PdfPCell cust_mob = new PdfPCell(new Paragraph(rs.getString("cust_mob")));
					table2.addCell(cust_mob);
					PdfPCell budget = new PdfPCell(new Paragraph(rs.getString("budget")));
					table2.addCell(budget);

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// Adding cells to the table

			// Adding Table to document
			document.add(table);
			document.add(table2);
			document.close();
		} catch (DocumentException exc) {
			throw new IOException(exc.getMessage());
		} finally {
			out.close();
		}
	}

}

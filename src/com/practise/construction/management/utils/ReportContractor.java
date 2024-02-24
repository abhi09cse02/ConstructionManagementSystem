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
 * Servlet implementation class ReportCon
 */
public class ReportContractor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportContractor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

			PdfPCell cell2 = new PdfPCell(new Paragraph("Contractors Detailed Report"));
			cell2.setBorder(Rectangle.NO_BORDER);
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			table.addCell(cell1);
			table.addCell(cell2);

			PdfPTable table2 = new PdfPTable(5);
			table2.setSpacingBefore(20f);
			PdfPCell h1 = new PdfPCell(new Paragraph("Contractors Id"));
			/*h1.setBorder(Rectangle.NO_BORDER);*/
			h1.setBackgroundColor(Color.white);
			h1.setPaddingLeft(10);
			h1.setHorizontalAlignment(Element.ALIGN_CENTER);
			h1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h2 = new PdfPCell(new Paragraph("Full Name"));
			
			h2.setBackgroundColor(Color.white);
			h2.setPaddingLeft(10);
			h2.setHorizontalAlignment(Element.ALIGN_CENTER);
			h2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h3 = new PdfPCell(new Paragraph("Email"));
			
			h3.setBackgroundColor(Color.white);
			h3.setPaddingLeft(10);
			h3.setHorizontalAlignment(Element.ALIGN_CENTER);
			h3.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h4 = new PdfPCell(new Paragraph("User Name"));
			
			h4.setBackgroundColor(Color.white);
			h4.setPaddingLeft(10);
			h4.setHorizontalAlignment(Element.ALIGN_CENTER);
			h4.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell h5 = new PdfPCell(new Paragraph("Mobile"));
			
			h5.setBackgroundColor(Color.white);
			h5.setPaddingLeft(10);
			h5.setHorizontalAlignment(Element.ALIGN_CENTER);
			h5.setVerticalAlignment(Element.ALIGN_MIDDLE);
		
			table2.addCell(h1);
			table2.addCell(h2);
			table2.addCell(h3);
			table2.addCell(h4);
			table2.addCell(h5);
		

			Connection con = DbConUtil.getConnection();
			PreparedStatement pre;
			try {
				pre = con.prepareStatement("select * from contractor_reg");

				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					PdfPCell conid = new PdfPCell(new Paragraph(rs.getString("conid")));
					table2.addCell(conid);
					PdfPCell fullname = new PdfPCell(new Paragraph(rs.getString("fullname")));
					table2.addCell(fullname);
					PdfPCell email = new PdfPCell(new Paragraph(rs.getString("email")));
					table2.addCell(email);
					PdfPCell username = new PdfPCell(new Paragraph(rs.getString("username")));
					System.out.println(rs.getString("username"));
					table2.addCell(username);
					PdfPCell mobile = new PdfPCell(new Paragraph(rs.getString("mobile")));
					table2.addCell(mobile);
					

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

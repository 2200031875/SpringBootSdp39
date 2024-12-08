package com.klef.jfsd.springboot.model;

import java.io.ByteArrayOutputStream;

import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.*;
import com.itextpdf.layout.element.*;

public class PDFGenerator {

    public static byte[] generatePortfolioPDF(Portfolio portfolio) {
        try (ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            // Create PDF document
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            // Add portfolio title
            document.add(new Paragraph("Portfolio Summary").setBold().setFontSize(18).setMarginBottom(10));

            // Add Personal Information
            if (portfolio.getPersonalInformation() != null) {
                document.add(new Paragraph("Personal Information").setBold().setFontSize(14));
                document.add(new Paragraph("Name: " + portfolio.getPersonalInformation().getFullName()));
                document.add(new Paragraph("Email: " + portfolio.getPersonalInformation().getEmailAddress()));
                document.add(new Paragraph("ContactNumber: " + portfolio.getPersonalInformation().getContactNumber()));
            }

            // Add Skills
            if (portfolio.getSkills() != null && !portfolio.getSkills().isEmpty()) {
                document.add(new Paragraph("\nSkills").setBold().setFontSize(14));
                for (var skill : portfolio.getSkills()) {
                    document.add(new Paragraph("- " + skill.getSkillName()));
                    document.add(new Paragraph("- " + skill.getSkillType()));
                }
            }

            // Add Achievements
            if (portfolio.getAchievements() != null && !portfolio.getAchievements().isEmpty()) {
                document.add(new Paragraph("\nAchievements").setBold().setFontSize(14));
                for (var achievement : portfolio.getAchievements()) {
                    document.add(new Paragraph("- " + achievement.getTitle()));
                    document.add(new Paragraph("- " + achievement.getDescription()));
                    document.add(new Paragraph("- " + achievement.getType()));
                   
                }
            }

            // Add Articles
            if (portfolio.getArticles() != null && !portfolio.getArticles().isEmpty()) {
                document.add(new Paragraph("\nArticles").setBold().setFontSize(14));
                for (var article : portfolio.getArticles()) {
                    document.add(new Paragraph("- " + article.getTitle()));
                    document.add(new Paragraph("- " + article.getPublicationDate()));
                    document.add(new Paragraph("- " + article.getArticleLink()));
                }
            }

            // Add Projects
            if (portfolio.getProjectPortfolios() != null && !portfolio.getProjectPortfolios().isEmpty()) {
                document.add(new Paragraph("\nProjects").setBold().setFontSize(14));
                for (var project : portfolio.getProjectPortfolios()) {
                    document.add(new Paragraph("- " + project.getDescription()));
                    document.add(new Paragraph("- " + project.getDuration()));
                    document.add(new Paragraph("- " + project.getTechnologiesUsed()));
                    document.add(new Paragraph("- " + project.getTitle()));
                    document.add(new Paragraph("- " + project.getProjectLink()));
                }
            }

            // Close document
            document.close();
            return out.toByteArray();
        } catch (Exception e) {
            throw new RuntimeException("Error generating PDF", e);
        }
    }
}

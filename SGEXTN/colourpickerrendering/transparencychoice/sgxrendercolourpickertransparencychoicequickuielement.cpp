#include "sgxrendercolourpickertransparencychoicequickuielement.h"
#include "sgxrendercolourpickertransparencychoicematerial.h"
#include <QSGGeometryNode>
#include <span>
#include <QQuickItem>
#include <QSGGeometry>

SGXRenderColourPickerTransparencyChoiceQuickUIElement::SGXRenderColourPickerTransparencyChoiceQuickUIElement(){
    (*this).setFlag(QQuickItem::ItemHasContents, true);
    selectedHue = 0.0f;
    selectedSaturation = 0.0f;
    selectedLightness = 0.0f;
    selectedTransparency = 0.0f;
}

QSGNode* SGXRenderColourPickerTransparencyChoiceQuickUIElement::updatePaintNode(QSGNode *thisNode, UpdatePaintNodeData */*unused*/){
    QSGGeometryNode* n = static_cast<QSGGeometryNode*>(thisNode); // NOLINT(cppcoreguidelines-pro-type-static-cast-downcast)
    if(n == nullptr){
        n = new QSGGeometryNode();
        QSGGeometry* g = new QSGGeometry(QSGGeometry::defaultAttributes_TexturedPoint2D(), 4, 6);
        (*g).setDrawingMode(QSGGeometry::DrawTriangles);
        (*n).setGeometry(g);
        (*n).setFlag(QSGNode::OwnsGeometry);
        SGXRenderColourPickerTransparencyChoiceMaterial* m = new SGXRenderColourPickerTransparencyChoiceMaterial();
        (*n).setMaterial(m);
        (*n).setFlag(QSGNode::OwnsMaterial);
        (*g).allocate(4, 6);
        unsigned short* tgPointer = (*g).indexDataAsUShort();
        const std::span<unsigned short> tg(tgPointer, 6);
        tg[0] = 0;
        tg[1] = 1;
        tg[2] = 2;
        tg[3] = 1;
        tg[4] = 2;
        tg[5] = 3;
    }
    QSGGeometry::TexturedPoint2D* vtPointer = (*(*n).geometry()).vertexDataAsTexturedPoint2D();
    const std::span<QSGGeometry::TexturedPoint2D> vt(vtPointer, 4);
    SGXRenderColourPickerTransparencyChoiceMaterial* mat = static_cast<SGXRenderColourPickerTransparencyChoiceMaterial*>((*n).material()); // NOLINT(cppcoreguidelines-pro-type-static-cast-downcast)
    const float x = static_cast<float>((*this).mapToGlobal(0, 0).x());
    const float y = static_cast<float>((*this).mapToGlobal(0, 0).y());
    const float w = static_cast<float>((*this).width());
    const float h = static_cast<float>((*this).height());
    vt[0].set(0, 0, 0.0f, 0.0f);
    vt[1].set(w, 0, 1.0f, 0.0f);
    vt[2].set(0, h, 0.0f, 1.0f);
    vt[3].set(w, h, 1.0f, 1.0f);
    (*mat).x = x;
    (*mat).y = y;
    (*mat).w = w;
    (*mat).h = h;
    (*mat).selectedHue = (*this).selectedHue;
    (*mat).selectedSaturation = (*this).selectedSaturation;
    (*mat).selectedLightness = (*this).selectedLightness;
    (*mat).selectedTransparency = (*this).selectedTransparency;
    (*n).markDirty(QSGNode::DirtyMaterial | QSGNode::DirtyGeometry);
    return n;
}

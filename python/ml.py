import pandas as pd
data = pd.read_csv("deneme.txt",engine = "python")
#print(data)

sentences_training = [doc for doc in data.iloc[:,0]]
classification_training = [doc for doc in data.iloc[:,1]]
print(sentences_training)
print(classification_training)

from sklearn.feature_extraction.text import TfidfVectorizer
vectorizer = TfidfVectorizer(analyzer='word', lowercase = True)

sen_train_vector = vectorizer.fit_transform(sentences_training)
print(sen_train_vector.toarray())

from sklearn.naive_bayes import GaussianNB

clf = GaussianNB()
model = clf.fit(X=sen_train_vector.toarray(), y=classification_training)

sen_test_vector = vectorizer.transform(['bu kadar kötü bir ürün görmedim'])
print(sen_test_vector.toarray())
y_pred = model.predict(sen_test_vector.toarray())

print(y_pred)

sen_test_vector = vectorizer.transform(['iyi bir ürünmüş.'])
y_pred = model.predict(sen_test_vector.toarray())
print(y_pred)
def search(desc):
    sen_test_vector = vectorizer.transform([desc])
    print(sen_test_vector.toarray())
    y_pred = model.predict(sen_test_vector.toarray())

    return (y_pred[0])
